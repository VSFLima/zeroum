<template>
        <div class="w-full max-w-[450px] pl-2 pr-2 mbtrs fixed">
            <div class="flex justify-center items-between items-center p-1 w-full">
                <span class="ml-1 mr-1 custom-font-bonus text-color">Recargas acumuladas</span>
                <span class="ml-1 mr-1 custom-font-bonus text-bold text-color">{{ recargasCumulativas || 0 }}</span>
            </div>

            <div class="flex w-full hgfdgg">
                <aside class="2x1:w-1/5 md:w-1/5 p-0 bg-transparent sticky top-0">
                    <ul class="space-y-4 flex flex-col justify-center items-center">
                       <button @click="$router.push('/profile/mission')" 
        :class="['btn-nav custom-font-botoes', { active: isActive('/profile/mission') }]"
        v-html="$t('Bônus de novos membros').replace('de', 'de<br>')">
</button>


                        <!-- Exibe o botão somente se houver missões para coletar -->
                        <button v-if="hasCollectableMissions" @click="collectAllMissions" class="btn-navsd custom-font-botoes">
                            {{ $t('Coletar Tudo') }}
                        </button>

                        <button @click="$router.push({ path: '/profile/financas', query: { tab: 'registrodedepositos' } })" 
                    :class="['btn-navs custom-font-botoes', { active: isActive('') }]">
                            {{ $t('Histórico') }}
                        </button>
                    </ul>
                </aside>

                <div class="2x1:w-4/5 md:w-4/5 pl-2 w-full h-full max-h-[80vh] overflow-y-auto hide-scrollbar">

                    <div class="grid grid-cols-1 gap-4 w-full">
                        <div v-for="mission in missions" :key="mission.id" class="rounded-lg p-2 background-bottom-navigation">
                            <div class="flex justify-between">
                                <h3 class="custom-font-title text-color left-1">{{ mission.name_mission }}</h3>
                                <button 
                                    :class="[
                                        'py-1 px-2 right-0',
                                        isMissionBonusCollected(mission) ? 'btns-collected' : (isCollectButtonEnabled(mission) ? 'btnss' : 'btns-disabled')
                                    ]" 
                                    :disabled="!isCollectButtonEnabled(mission) || isMissionBonusCollected(mission)" 
                                    @click="!isMissionBonusCollected(mission) && collectMission(mission.id)">
                                    {{ isMissionBonusCollected(mission) ? 'Recebido' : (isCollectButtonEnabled(mission) ? 'Receber' : 'Prosseguir') }}
                                </button>
                            </div>
                            <p class="custom-font-bonuss text-color">Bônus {{ mission.bonus_amount }}</p>
                        </div>
                        <div class="rounded-lg p-2 background-bottom-navigation mb-24">
                            <h4 class="custom-font-title-roles text-color">I. Hora da tarefa (UTC-3):</h4>
                            <p class="custom-font-title-roles">Missões de longo prazo (reiniciadas todas as segundas-feiras às 00:00)</p>
                            
                            <h4 class="custom-font-title-roles text-color">II. Condições da tarefa:</h4>
                            <p class="custom-font-title-roles">Recarregar ou apostar todas as semanas</p>
                            
                            <h4 class="custom-font-title-roles text-color">III. Conteúdo da tarefa:</h4>
                            <p class="custom-font-title-roles">
                                1. As tarefas acima podem ser concluídas mensalmente, e as tarefas incluem depósitos mensais, apostas em jogos únicos ou auditoria. Completar as tarefas renderá uma certa quantidade de bônus; quanto maior a dificuldade, maior a recompensa.<br>
                                2. Se satisfizer as condições, pode levantar diretamente. Podem levantar-se diferentes quantidades uma a uma, recomenda-se o download da versão HD da aplicação para uma experiência mais agradável.<br>
                                3. Diretamente reclamado em Android, H5, PC, e invalidado após a data de validade (ou seja, se não for reclamado ativamente, considera-se renunciado);<br>
                                4. O bônus fornecido por esta tarefa (excluindo o principal) requer 5 vezes de auditoria (ou seja, auditoria, auditoria, ou apostas válidas) para ser elegível para saque;<br>
                                5. Esta missões tem utilização limitada ao proprietário da conta para uma jogabilidade normal. O recurso a esquemas de aluguer, a utilização de simuladores (programas de burla), robots, apostas intencionais com contas diferentes, configurações intencionais, concertação, associação, acordo, utilização de lacunas, controlo de grupo ou outros meios técnicos de participação são estritamente proibidos, caso contrário, as recompensas serão confiscadas, congeladas ou deduzidas da recompensa, ou as contas poderão mesmo ser postas na lista negra.<br>
                                6. Para evitar diferenças na compreensão do texto, a plataforma reserva-se o direito de interpretação final deste evento.
                            </p>
                        </div>
                    </div>

                </div>
            </div>



            
        </div>
</template>

<script>
import BauLayout from "@/Layouts/BauLayout.vue";
import HttpApi from "@/Services/HttpApi.js";
import { useToast } from "vue-toastification";

export default {
    components: { BauLayout },
    data() {
        return {
            missions: [],
            recargasCumulativas: 0,
        };
    },
    async created() {
        await this.fetchMissions();
        await this.fetchUserDeposits();
    },
    computed: {
        hasCollectableMissions() {
            return this.missions.some(mission => 
                this.isCollectButtonEnabled(mission) && !this.isMissionBonusCollected(mission)
            );
        }
    },
    methods: {
        async fetchMissions() {
            try {
                const response = await HttpApi.get(`/missions/check-status`);
                this.missions = response.data;
            } catch (error) {
                console.error('Erro ao buscar missões:', error);
                this.$toast.error('Erro ao buscar missões.');
            }
        },
        async fetchUserDeposits() {
            try {
                const response = await HttpApi.get(`/user-deposits`);
                this.recargasCumulativas = parseFloat(response.data.recargasCumulativas) || 0;
            } catch (error) {
                console.error('Erro ao buscar depósitos do usuário:', error);
                this.$toast.error('Erro ao buscar depósitos.');
            }
        },
        isCollectButtonEnabled(mission) {
            const missionStatus = parseInt(mission.status, 10);
            const requiredAmount = parseFloat(mission.deposit_acumulated_necessario);
            return missionStatus === 1 && this.recargasCumulativas >= requiredAmount;
        },
        isMissionBonusCollected(mission) {
            return parseInt(mission.status, 10) === 2;
        },
      async collectMission(missionId) {
            const _toast = useToast(); // Inicializa o toast
            this.isLoading = true; // Indica que a operação está em andamento

            try {
                const response = await HttpApi.post(`/missions/collect/${missionId}`);
                
                // Configurações do toast
                const toastOptions = {
                    position: 'top-center', // Posiciona no centro superior
                    timeout: 3000, // Tempo de exibição
                    className: 'custom-toast' // Classe customizada para estilização
                };

                // Verifica se a resposta foi bem-sucedida
                if (response.status === 200) {
                    // Exibe a mensagem de sucesso
                    if (response.data.message) {
                        _toast.success(response.data.message, toastOptions);
                    } else {
                        _toast.success('Operação bem-sucedida',  toastOptions);
                    }

                    // Atualiza dados adicionais
                    await this.fetchMissions(); 
                    await this.fetchUserDeposits();
                } else {
                    // Exibe uma mensagem de erro genérica
                    _toast.error('Erro inesperado ao coletar missão.', toastOptions);
                }
            } catch (error) {
                // Exibe a mensagem de erro detalhada
                if (error.response && error.response.data && error.response.data.error) {
                    _toast.error(error.response.data.error, toastOptions);
                } else {
                    _toast.error('Erro ao coletar missão.', toastOptions);
                }
            } finally {
                this.isLoading = false; // Indica que a operação foi concluída
            }
        },
         async collectAllMissions() {
            const _toast = useToast(); // Inicializa o toast
            this.isLoading = true; // Indica que a operação está em andamento

            // Configurações do toast
            const toastOptions = {
                position: 'top-center', // Posiciona no centro superior
                timeout: 3000, // Tempo de exibição
                className: 'custom-toast' // Classe customizada para estilização
            };

            try {
                // Filtra missões que são elegíveis para coleta
                const missionsToCollect = this.missions.filter(mission => 
                    this.isCollectButtonEnabled(mission) && !this.isMissionBonusCollected(mission)
                );

                // Cria uma lista de promessas para coletar todas as missões elegíveis
                const collectPromises = missionsToCollect.map(mission => 
                    HttpApi.post(`/missions/collect/${mission.id}`)
                );

                // Aguarda a conclusão de todas as promessas
                await Promise.all(collectPromises);

                // Exibe a mensagem de sucesso
                _toast.success('Todas as missões elegíveis foram coletadas.', toastOptions);

                // Atualiza a lista de missões e recargas após a coleta
                await this.fetchMissions(); // Recarregar missões após coleta
                await this.fetchUserDeposits(); // Atualizar recargas acumuladas
            } catch (error) {
                console.error('Erro ao coletar todas as missões:', error);

                // Exibe a mensagem de erro
                _toast.error('Erro ao coletar todas as missões.', toastOptions);
            } finally {
                this.isLoading = false; // Indica que a operação foi concluída
            }
        },
        isActive(route) {
            return this.$route.path === route;
        }
    }
};
</script>





<style scoped>
/* CSS para esconder a barra de rolagem */
.hide-scrollbar {
  scrollbar-width: none; /* Firefox */
  -ms-overflow-style: none;  /* Internet Explorer 10+ */
}

.hide-scrollbar::-webkit-scrollbar {
  width: 0;  /* Safari e Chrome */
  height: 0; /* Safari e Chrome */
}
.custom-toast {
    max-width: 400px;
    margin: 0 auto; /* Centraliza horizontalmente */
}
.pie {
    position: relative;
    width: 80px;
    height: 35px;
    border-radius: 7px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 16px;
    color: var(--text-color);
    border: 1px solid var(--borders-and-dividers-colors); /* Borda escura ao redor do círculo */
}
.btns-disabled {
    font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    font-style: normal;
    line-height: 20px;
    font-weight: 400;
    border: 1px solid var(--borders-and-dividers-colors); /* Borda escura ao redor do círculo */
    border-radius: 7px;
    transition: background-color 0.3s ease;
    display: flex;
    align-items: center;
    color: var(--text-color);
    background-color: var(--background-bottom-navigation);
}
.btnss {
       font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    font-style: normal;
    line-height: 20px;
    font-weight: 400;
    border: 1px solid var(--background-itens-selected); /* Borda escura ao redor do círculo */
    border-radius: 7px;
    transition: background-color 0.3s ease;
    display: flex;
    align-items: center;
    color: var(--text-color);
    background-color: var(--background-bottom-navigation);
}
.btns-collected {
       font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    font-style: normal;
    line-height: 20px;
    font-weight: 400;
    border: 1px solid var(--background-itens-selected); /* Borda para o estado coletado */
    border-radius: 10px;
    background-color: var(--background-collected); /* Cor para o estado coletado */
    color: var(--text-color);
    cursor: not-allowed;
}
.hgfdgg{
    margin-bottom: 65px;
    padding-bottom: 65px;
}
.mbtrs{
    margin-bottom: 65px;
}
.btn-nav {
    border-radius: 7px;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 10px;
    padding-bottom: 10px;
    color: var(--text-color);
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: flex;
    align-items: center;
    position: relative;
    background-color: var(--background-bottom-navigation);
}
.btn-navs {
    border-radius: 7px;
    padding: 8px 8px;
    color: var(--text-color);
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: flex;
    align-items: center;
    background-color: var(--background-bottom-navigation);
}

.btn-navsd {
    border: 1px solid var(--background-itens-selected); /* Borda escura ao redor do círculo */
    border-radius: 7px;
    transition: background-color 0.3s ease;
    padding: 8px 8px;
    color: var(--text-color);
    cursor: pointer;
    transition: background-color 0.3s ease;
    display: flex;
    align-items: center;
    background-color: var(--background-bottom-navigation);
}

.backgen {
    background-color: var(--background-color-cassino);
    border-radius: 7px;
    padding: 6px 6px;
}
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap');

body {
    font-family: 'Helvetica', sans-serif; /* Define a fonte Helvetica para todo o documento */
}

.custom-font-title-roles {
    font-family: 'Helvetica', sans-serif;
    font-size: 13px;
    font-style: normal;
    line-height: 23px;
    font-weight: 400;
    color: var(--text-color);
}
.custom-font-title {
    font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    font-style: normal;
    line-height: 17px;
    font-weight: 400;
    color: var(--text-color);
}
.custom-font-bonus {
    font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    font-style: normal;
    line-height: normal;
    font-weight: 400;
    color: var(--text-color);
}
.custom-font-bonuss {
    font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    opacity: 80%;
    font-style: normal;
    line-height: normal;
    font-weight: 400;
    color: var(--text-color);
}
.custom-font-botoes {
    font-family: 'Helvetica', sans-serif;
    font-size: 10px;
    font-style: normal;
    line-height: 14px;
    font-weight: 400;
    color: var(--text-color);
}
</style>
