<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="dark">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

    <meta name=mobile-web-app-capable content=yes>
    <meta name=apple-mobile-web-app-capable content=yes>
    <meta name=apple-mobile-web-app-status-bar-style content=black-translucent>
    <meta http-equiv=X-UA-Compatible content="ie=edge">
    <meta http-equiv=Content-Security-Policy content=upgrade-insecure-requests>

    @php $setting = \Helper::getSetting() @endphp
    @if (!empty($setting['software_favicon']))
        <link rel="icon" type="image/png" sizes="32x32" href="{{ asset('/storage/' . $setting['software_favicon']) }}">
    @endif

    <link rel="stylesheet" href="{{ asset('assets/css/fontawesome.min.css') }}">
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700&family=Roboto+Condensed:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;1,100&display=swap"
        rel="stylesheet">
    <title>{{ env('APP_NAME') }}</title>

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    @php $custom = \Helper::getCustom() @endphp
    <style>
        body {
            font-family: {{ $custom['font_family_default'] ?? "'Roboto Condensed', sans-serif" }};
        }

        :root {
            --ci-primary-color: {{ $custom['primary_color'] }};
            --ci-primary-opacity-color: {{ $custom['primary_opacity_color'] }};
            --ci-secundary-color: {{ $custom['secundary_color'] }};
            --ci-gray-dark: {{ $custom['gray_dark_color'] }};
            --ci-gray-light: {{ $custom['gray_light_color'] }};
            --ci-gray-medium: {{ $custom['gray_medium_color'] }};
            --ci-gray-over: {{ $custom['gray_over_color'] }};
            --title-color: {{ $custom['title_color'] }};
            --text-color: {{ $custom['text_color'] }};
            --value-color-jackpot: {{ $custom['value_color_jackpot'] }};
            --value-color-navtop: {{ $custom['value_wallet_navtop'] }};
            --bonus-color-dep: {{ $custom['bonus_color_dep'] }};
            --sub-text-color: {{ $custom['sub_text_color'] }};
            --text-sub-color: {{ $custom['text_sub_color'] }};
            --back-sub-color: {{ $custom['back_sub_color'] }};
            --item-sub-color: {{ $custom['item_sub_color'] }};
            --title-sub-color: {{ $custom['title_sub_color'] }};
            --placeholder-color: {{ $custom['placeholder_color'] }};
            --placeholder-background: {{ $custom['placeholder_background'] }};
            --text-color-footer: {{ $custom['text_color_footer'] }};
            --opacity-bottom-nav: {{ $custom['opacity_bottom_nav'] }};
            --opacity-categories: {{ $custom['opacity_categories'] }};
            --card-transaction: {{ $custom['card_transaction'] }};
            --values-deposit: {{ $custom['colors_deposit_value'] }};
            --colors-players: {{ $custom['color_players'] }};
            --standard-color: #1C1E22;
            --shadow-color: #111415;
            --page-shadow: linear-gradient(to right, #111415, rgba(17, 20, 21, 0));
            --autofill-color: #f5f6f7;
            --yellow-color: #FFBF39;
            --yellow-dark-color: #d7a026;
            --border-radius: {{ $custom['border_radius'] }};
            --tw-border-spacing-x: 0;
            --tw-border-spacing-y: 0;
            --tw-translate-x: 0;
            --tw-translate-y: 0;
            --tw-rotate: 0;
            --tw-skew-x: 0;
            --tw-skew-y: 0;
            --tw-scale-x: 1;
            --tw-scale-y: 1;
            --tw-scroll-snap-strictness: proximity;
            --tw-ring-offset-width: 0px;
            --tw-ring-offset-color: #fff;
            --tw-ring-color: rgba(59, 130, 246, .5);
            --tw-ring-offset-shadow: 0 0 #0000;
            --tw-ring-shadow: 0 0 #0000;
            --tw-shadow: 0 0 #0000;
            --tw-shadow-colored: 0 0 #0000;

            --botao-deposito-text-nav: {{ $custom['botao_deposito_text_nav'] }};
            --botao-login-text-nav: {{ $custom['botao_login_text_nav'] }};
            --botao-registro-text-nav: {{ $custom['botao_registro_text_nav'] }};
            --botao-login-text-modal: {{ $custom['botao_login_text_modal'] }};
            --botao-registro-text-modal: {{ $custom['botao_registro_text_modal'] }};

            --border-registro-nav: {{ $custom['botao_registro_border_nav'] }};
            --border-login-nav: {{ $custom['botao_login_border_nav'] }};
            --border-deposito-nav: {{ $custom['botao_deposito_border_nav'] }};
            --text-opacity: {{ $custom['text_opacity'] }};
            --background-color-category: {{ $custom['background_color_category'] }};
            --background-color-jackpot: {{ $custom['background_color_jackpot'] }};


            --botao-deposito-text-dep: {{ $custom['botao_deposito_text_dep'] }};
            --botao-deposito-background-dep: {{ $custom['botao_deposito_background_dep'] }};
            --botao-deposito-border-dep: {{ $custom['botao_deposito_border_dep'] }};

            --botao-deposito-text-saq: {{ $custom['botao_deposito_text_saq'] }};
            --botao-deposito-background-saq: {{ $custom['botao_deposito_background_saq'] }};
            --botao-deposito-border-saq: {{ $custom['botao_deposito_border_saq'] }};



            /* Adicionando unidades apropriadas */
            --invert-config: {{ $custom['invert_percentage'] }}%;
            --sepia-config: {{ $custom['sepia_percentage'] }}%;
            --saturate-config: {{ $custom['saturate_percentage'] }}%;
            --hue-rotate-config: {{ $custom['hue_rotate_deg'] }}deg;
            --brightness-config: {{ $custom['brightness_percentage'] }}%;
            --contrast-config: {{ $custom['contrast_percentage'] }}%;

            --input-primary: {{ $custom['input_primary'] }};
            --input-primary-dark: {{ $custom['input_primary_dark'] }};

            --carousel-banners: {{ $custom['carousel_banners'] }};
            --carousel-banners-dark: {{ $custom['carousel_banners_dark'] }};


            --sidebar-color: {{ $custom['sidebar_color'] }} !important;
            --sidebar-color-dark: {{ $custom['sidebar_color_dark'] }} !important;

            --color-bt-1: {{ $custom['color_bt_1'] }} !important;
            --color-bt-1-dark: {{ $custom['color_bt_1_dark'] }} !important;

            --color-bt-2: {{ $custom['color_bt_2'] }} !important;
            --color-bt-2-dark: {{ $custom['color_bt_2_dark'] }} !important;

            --color-bt-3: {{ $custom['color_bt_3'] }} !important;
            --color-bt-3-dark: {{ $custom['color_bt_3_dark'] }} !important;

            --color-bt-4: {{ $custom['color_bt_4'] }} !important;
            --color-bt-4-dark: {{ $custom['color_bt_4_dark'] }} !important;

            --background-bottom-navigation: {{ $custom['background_bottom_navigation'] }} !important;
            --background-bottom-navigation-dark: {{ $custom['background_bottom_navigation_dark'] }} !important;

            --background-color-cassino: {{ $custom['background_color_cassino'] }} !important;
            --background-color-cassino-dark: {{ $custom['background_color_cassino_dark'] }} !important;

            --background-itens-selected: {{ $custom['Border_bottons_and_selected'] }} !important;
            --background-itens-selected-dark: {{ $custom['Border_bottons_and_selected_dark'] }} !important;

            --borders-and-dividers-colors: {{ $custom['borders_and_dividers_colors'] }} !important;
            --borders-and-dividers-colors-dark: {{ $custom['borders_and_dividers_colors_dark'] }} !important;

            --search-back: {{ $custom['search_back'] }} !important;
            --search-back-dark: {{ $custom['search_back_dark'] }} !important;


            --botao-deposito-background-nav: {{ $custom['botao_deposito_background_nav'] }} !important;
            --botao-deposito-background-nav-dark: {{ $custom['botao_deposito_background_nav_dark'] }} !important;

            --botao-login-background-nav: {{ $custom['botao_login_background_nav'] }} !important;
            --botao-login-background-nav-dark: {{ $custom['botao_login_background_nav_dark'] }} !important;

            --botao-registro-background-nav: {{ $custom['botao_registro_background_nav'] }} !important;
            --botao-registro-background-nav-dark: {{ $custom['botao_registro_background_nav_dark'] }} !important;

            --botao-login-background-modal: {{ $custom['botao_login_background_modal'] }} !important;
            --botao-login-background-modal-dark: {{ $custom['botao_login_background_modal_dark'] }} !important;

            --botao-registro-background-modal: {{ $custom['botao_registro_background_modal'] }} !important;
            --botao-registro-background-modal-dark: {{ $custom['botao_registro_background_modal_dark'] }} !important;




            --navtop-color {{ $custom['navtop_color'] }};
            --navtop-color-dark: {{ $custom['navtop_color_dark'] }};


            --side-menu {{ $custom['side_menu'] }};
            --side-menu-dark: {{ $custom['side_menu_dark'] }};

            --footer-color {{ $custom['footer_color'] }};
            --footer-color-dark: {{ $custom['footer_color_dark'] }};

            --card-color {{ $custom['card_color'] }};
            --card-color-dark: {{ $custom['card_color_dark'] }};

            --transaction-background: {{ $custom['transaction_item_background'] }};



        }

        .navtop-color {
            background-color: {{ $custom['navtop_color'] }} !important;
        }

        :is(.dark .navtop-color) {
            background-color: {{ $custom['navtop_color_dark'] }} !important;
        }

        .background-bottom-navigation {
            background-color: {{ $custom['background_bottom_navigation'] }} !important;
        }

        :is(.dark .background-bottom-navigation) {
            background-color: {{ $custom['background_bottom_navigation_dark'] }} !important;
        }

        .bg-base {
            background-color: {{ $custom['background_base'] }};
        }

        :is(.dark .bg-base) {
            background-color: {{ $custom['background_base_dark'] }};
        }

        .background-color-cassino {
            background-color: {{ $custom['background_color_cassino'] }};
        }

        :is(.dark .background-color-cassino) {
            background-color: {{ $custom['background_color_cassino_dark'] }};
        }

        .background-itens-selected {
            background-color: {{ $custom['Border_bottons_and_selected'] }};
        }

        :is(.dark .background-itens-selected) {
            background-color: {{ $custom['Border_bottons_and_selected_dark'] }};
        }

        /* ========================================================================= */
        /* ANIMAÇÕES PARA SPINNER E BOTÕES DO DEPÓSITO PIX                          */
        /* ========================================================================= */
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.6; }
        }

        .pix-spinner {
            animation: spin 1s linear infinite !important;
        }

        .pix-text-loading {
            animation: pulse 1.5s ease-in-out infinite !important;
        }

        /* Overlay do spinner */
        #pixLoadingOverlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(17, 24, 39, 0.95);
            z-index: 9999;
            display: none !important;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
        }

        #pixLoadingOverlay.show {
            display: flex !important;
            opacity: 1 !important;
            pointer-events: all !important;
        }
    </style>

    @if (!empty($custom['custom_css']))
        <style>
            {!! $custom['custom_css'] !!}
        </style>
    @endif

    @if (!empty($custom['custom_header']))
        {!! $custom['custom_header'] !!}
    @endif

    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <script>
        //         document.addEventListener('contextmenu', function(e) {
        //            e.preventDefault();
        //        });
        //

        //        document.addEventListener('keydown', function(e) {
        //           if (e.key === 'F12' || (e.ctrlKey && e.shiftKey && e.key === 'I') || (e.ctrlKey && e.key === 'U')) {
        //                e.preventDefault();
        //           }
        //       });

        //
    </script>

</head>

<body color-theme="dark" class="bg-base text-gray-800 dark:text-gray-300 ">
    <div id="infinitysoft"></div>

    <!-- ========================================================================= -->
    <!-- OVERLAY DO SPINNER DE LOADING                                             -->
    <!-- ========================================================================= -->
    <div id="pixLoadingOverlay">
        <svg class="pix-spinner" style="width: 80px; height: 80px; margin-bottom: 20px;" viewBox="0 0 100 101" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z" fill="#374151"/>
            <path d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z" fill="#fbbf24"/>
        </svg>
        <span class="pix-text-loading" style="color: #fbbf24; font-size: 20px; font-weight: bold;">Gerando seu código PIX...</span>
    </div>
    <!-- ========================================================================= -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.0.0/datepicker.min.js"></script>
    <script>
        window.Livewire?.on('copiado', (texto) => {
            navigator.clipboard.writeText(texto).then(() => {
                Livewire.emit('copiado');
            });
        });

        window._token = '{{ csrf_token() }}';
        //if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        if (localStorage.getItem('color-theme') === 'light') {
            document.documentElement.classList.remove('dark')
            document.documentElement.classList.add('light');
        } else {
            document.documentElement.classList.remove('light')
            document.documentElement.classList.add('dark')
        }
    </script>

    <!-- ========================================================================= -->
    <!-- SCRIPT PARA SPINNER E BOTÕES PIX - NÃO PRECISA COMPILAR                   -->
    <!-- ========================================================================= -->
    <script>
        (function() {
            try {
                let botoesAdicionados = false;
                let spinnerAtivo = false;
                let timeoutSpinner = null;
                let codigoPixAtual = '';
                
                // Garante que o overlay comece escondido
                window.addEventListener('DOMContentLoaded', function() {
                    const overlay = document.getElementById('pixLoadingOverlay');
                    if (overlay) {
                        overlay.style.display = 'none';
                        overlay.classList.remove('show');
                    }
                });
                
                // Função para mostrar mensagem HTML
                function mostrarMensagemHTML(texto, tipo = 'info', duracao = 3000) {
                    // Remove mensagens anteriores
                    const msgAnterior = document.getElementById('pixNotification');
                    if (msgAnterior) {
                        msgAnterior.remove();
                    }
                    
                    // Define cores por tipo
                    const cores = {
                        'success': { bg: '#10b981', border: '#059669', icon: 'fa-check-circle' },
                        'error': { bg: '#ef4444', border: '#dc2626', icon: 'fa-times-circle' },
                        'warning': { bg: '#f59e0b', border: '#d97706', icon: 'fa-exclamation-circle' },
                        'info': { bg: '#3b82f6', border: '#2563eb', icon: 'fa-info-circle' }
                    };
                    
                    const cor = cores[tipo] || cores['info'];
                    
                    // Cria elemento de notificação
                    const notification = document.createElement('div');
                    notification.id = 'pixNotification';
                    notification.style.cssText = `
                        position: fixed;
                        top: 20px;
                        left: 50%;
                        transform: translateX(-50%) translateY(-100px);
                        background: linear-gradient(135deg, ${cor.bg} 0%, ${cor.border} 100%);
                        color: white;
                        padding: 16px 24px;
                        border-radius: 12px;
                        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
                        z-index: 10000;
                        display: flex;
                        align-items: center;
                        gap: 12px;
                        font-size: 16px;
                        font-weight: 600;
                        opacity: 0;
                        transition: all 0.3s ease;
                        max-width: 90%;
                        word-wrap: break-word;
                    `;
                    
                    notification.innerHTML = `
                        <i class="fas ${cor.icon}" style="font-size: 24px;"></i>
                        <span>${texto}</span>
                    `;
                    
                    document.body.appendChild(notification);
                    
                    // Anima entrada
                    setTimeout(() => {
                        notification.style.transform = 'translateX(-50%) translateY(0)';
                        notification.style.opacity = '1';
                    }, 10);
                    
                    // Auto-remove
                    setTimeout(() => {
                        notification.style.transform = 'translateX(-50%) translateY(-100px)';
                        notification.style.opacity = '0';
                        setTimeout(() => {
                            notification.remove();
                        }, 300);
                    }, duracao);
                }
                
                // Função para verificar pagamento na API
                async function verificarPagamento() {
                    try {
                        mostrarMensagemHTML('Verificando pagamento...', 'info', 2000);
                        
                        // Pegar o token JWT do localStorage
                        const token = localStorage.getItem('token') || localStorage.getItem('auth_token') || localStorage.getItem('jwt_token');
                        
                        if (!token) {
                            console.error('Token JWT não encontrado');
                            mostrarMensagemHTML('❌ Erro: Você precisa estar logado', 'error', 4000);
                            return false;
                        }
                        
                        // Buscar o transaction_id do QR Code atual
                        const response = await fetch('/api/suitpay/check-payment', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json',
                                'Authorization': 'Bearer ' + token,
                                'X-CSRF-TOKEN': window._token || document.querySelector('meta[name="csrf-token"]')?.content
                            },
                            body: JSON.stringify({
                                qrcode: codigoPixAtual
                            })
                        });
                        
                        console.log('Response status:', response.status);
                        
                        if (!response.ok) {
                            const errorText = await response.text();
                            console.error('Erro na resposta:', errorText);
                            mostrarMensagemHTML('🔍 Estamos verificando. Tente novamente em alguns segundos..', 'error', 4000);
                            return false;
                        }
                        
                        const data = await response.json();
                        console.log('Dados recebidos:', data);
                        
                        if (data.success && data.paid) {
                            // PAGAMENTO CONFIRMADO!
                            mostrarMensagemHTML('✅ Pagamento confirmado! Saldo creditado.', 'success', 5000);
                            
                            // Recarrega a página após 2 segundos
                            setTimeout(() => {
                                window.location.reload();
                            }, 2000);
                            
                            return true;
                        } else if (data.success && !data.paid) {
                            // Ainda não foi pago
                            mostrarMensagemHTML('⏳ Pagamento ainda não identificado. Tente novamente em alguns segundos.', 'warning', 4000);
                            return false;
                        } else {
                            // Erro na verificação
                            mostrarMensagemHTML('🔍 Estamos verificando. Tente novamente em alguns segundos..', 'error', 4000);
                            return false;
                        }
                        
                    } catch (error) {
                        console.error('Erro ao verificar pagamento:', error);
                        mostrarMensagemHTML('❌ Erro de conexão. Verifique sua internet e tente novamente.', 'error', 4000);
                        return false;
                    }
                }
                
                // Função para mostrar spinner
                function mostrarSpinner() {
                    try {
                        const overlay = document.getElementById('pixLoadingOverlay');
                        if (overlay && !spinnerAtivo) {
                            overlay.style.display = 'flex';
                            setTimeout(() => {
                                overlay.classList.add('show');
                            }, 10);
                            spinnerAtivo = true;
                            console.log('🔄 Spinner iniciado...');
                            
                            // TIMEOUT DE SEGURANÇA: Se passar 30 segundos, esconde automaticamente
                            timeoutSpinner = setTimeout(() => {
                                console.warn('⏰ Timeout do spinner - escondendo após 30s');
                                esconderSpinner();
                            }, 30000);
                            
                            // Inicia verificação ATIVA do QR Code
                            iniciarVerificacaoQRCode();
                        }
                    } catch (error) {
                        console.error('Erro ao mostrar spinner:', error);
                    }
                }
                
                // Função para esconder spinner
                function esconderSpinner() {
                    try {
                        const overlay = document.getElementById('pixLoadingOverlay');
                        if (overlay) {
                            overlay.classList.remove('show');
                            setTimeout(() => {
                                overlay.style.display = 'none';
                            }, 300);
                            spinnerAtivo = false;
                            
                            // Limpa o timeout de segurança
                            if (timeoutSpinner) {
                                clearTimeout(timeoutSpinner);
                                timeoutSpinner = null;
                            }
                            
                            console.log('✅ Spinner finalizado!');
                        }
                    } catch (error) {
                        console.error('Erro ao esconder spinner:', error);
                    }
                }
                
                // Verifica ATIVAMENTE se o QR Code apareceu
                function iniciarVerificacaoQRCode() {
                    const maxTentativas = 100; // 100 x 300ms = 30 segundos
                    let tentativas = 0;
                    
                    const intervalo = setInterval(() => {
                        tentativas++;
                        
                        // Procura o input do PIX
                        const inputPix = document.getElementById('pixcopiaecola');
                        
                        if (inputPix && inputPix.value && inputPix.value.length > 10) {
                            // QR CODE APARECEU! Para spinner
                            console.log('✅ QR Code detectado! Parando spinner...');
                            codigoPixAtual = inputPix.value; // Salva o código PIX
                            clearInterval(intervalo);
                            esconderSpinner();
                            melhorarBotoesPix();
                        } else if (tentativas >= maxTentativas) {
                            // Timeout - para de verificar
                            console.warn('⏰ Timeout da verificação do QR Code');
                            clearInterval(intervalo);
                            esconderSpinner();
                        }
                    }, 300); // Verifica a cada 300ms
                }
                
                // Intercepta o botão "Confirmar Deposito"
                function interceptarBotaoDeposito() {
                    try {
                        const botoes = document.querySelectorAll('button');
                        botoes.forEach(btn => {
                            const texto = btn.textContent || btn.innerText;
                            if (texto && (texto.includes('Confirmar') && texto.includes('Deposito'))) {
                                if (!btn.hasAttribute('data-spinner-interceptado')) {
                                    btn.setAttribute('data-spinner-interceptado', 'true');
                                    btn.addEventListener('click', function(e) {
                                        console.log('🎯 Botão Confirmar Deposito clicado!');
                                        // Reseta flag de botões
                                        botoesAdicionados = false;
                                        codigoPixAtual = '';
                                        // Mostra spinner
                                        setTimeout(() => {
                                            mostrarSpinner();
                                        }, 100);
                                    });
                                }
                            }
                        });
                    } catch (error) {
                        console.error('Erro ao interceptar botão:', error);
                    }
                }
                
                function melhorarBotoesPix() {
                    try {
                        if (botoesAdicionados) return;
                        
                        const inputPix = document.getElementById('pixcopiaecola');
                        if (!inputPix || !inputPix.value || inputPix.value.length < 10) return;
                        
                        // Salva o código PIX
                        codigoPixAtual = inputPix.value;
                        
                        // QR Code está presente E tem valor! Para o spinner
                        esconderSpinner();
                        
                        const container = inputPix.closest('div').parentElement;
                        if (!container) return;
                        
                        // Procura pelo botão antigo de copiar
                        const botoesAntigos = container.querySelectorAll('button');
                        let botaoAntigoCopiar = null;
                        botoesAntigos.forEach(btn => {
                            if (btn.innerHTML.includes('fa-copy') || btn.textContent.includes('Copiar')) {
                                botaoAntigoCopiar = btn;
                            }
                        });
                        
                        // Remove o botão antigo
                        if (botaoAntigoCopiar) {
                            botaoAntigoCopiar.remove();
                        }
                        
                        // Estiliza o input
                        inputPix.style.cssText = 'background-color: #1f2937; color: #ffffff; padding: 12px 16px; width: 100%; border-radius: 8px; border: 1px solid #374151; font-size: 14px; outline: none; margin-bottom: 12px;';
                        
                        // Cria botão COPIAR
                        const btnCopiar = document.createElement('button');
                        btnCopiar.type = 'button';
                        btnCopiar.innerHTML = '<i class="fas fa-copy" style="font-size: 20px;"></i><span style="font-size: 17px; font-weight: 700;">COPIAR CÓDIGO PIX</span>';
                        btnCopiar.style.cssText = 'width: 100%; padding: 16px 24px; background: linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%); color: #000000; font-weight: bold; font-size: 17px; border-radius: 12px; border: none; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 12px; margin-bottom: 12px; box-shadow: 0 4px 20px rgba(251, 191, 36, 0.5); transition: all 0.3s ease; text-transform: uppercase; letter-spacing: 0.5px;';
                        
                        btnCopiar.ontouchstart = function() {
                            this.style.transform = 'scale(0.97)';
                            this.style.boxShadow = '0 2px 10px rgba(251, 191, 36, 0.4)';
                        };
                        
                        btnCopiar.ontouchend = function() {
                            this.style.transform = 'scale(1)';
                            this.style.boxShadow = '0 4px 20px rgba(251, 191, 36, 0.5)';
                        };
                        
                        btnCopiar.onclick = function(e) {
                            e.preventDefault();
                            navigator.clipboard.writeText(inputPix.value).then(() => {
                                const textoOriginal = this.innerHTML;
                                this.innerHTML = '<i class="fas fa-check" style="font-size: 20px;"></i><span style="font-size: 17px; font-weight: 700;">COPIADO!</span>';
                                this.style.background = 'linear-gradient(135deg, #10b981 0%, #059669 100%)';
                                
                                // Mostra mensagem HTML
                                mostrarMensagemHTML('✅ Código PIX copiado com sucesso!', 'success', 2000);
                                
                                setTimeout(() => {
                                    this.innerHTML = textoOriginal;
                                    this.style.background = 'linear-gradient(135deg, #fbbf24 0%, #f59e0b 100%)';
                                }, 2000);
                            }).catch(() => {
                                mostrarMensagemHTML('❌ Erro ao copiar. Tente novamente.', 'error', 3000);
                            });
                        };
                        
                        // Cria botão JÁ PAGUEI (com verificação real)
                        const btnPaguei = document.createElement('button');
                        btnPaguei.type = 'button';
                        btnPaguei.innerHTML = '<i class="fas fa-check-circle" style="font-size: 20px;"></i><span style="font-size: 17px; font-weight: 700;">JÁ PAGUEI</span>';
                        btnPaguei.style.cssText = 'width: 100%; padding: 16px 24px; background: linear-gradient(135deg, #10b981 0%, #059669 100%); color: #ffffff; font-weight: bold; font-size: 17px; border-radius: 12px; border: none; cursor: pointer; display: flex; align-items: center; justify-content: center; gap: 12px; box-shadow: 0 4px 20px rgba(16, 185, 129, 0.5); transition: all 0.3s ease; text-transform: uppercase; letter-spacing: 0.5px;';
                        
                        btnPaguei.ontouchstart = function() {
                            this.style.transform = 'scale(0.97)';
                            this.style.boxShadow = '0 2px 10px rgba(16, 185, 129, 0.4)';
                        };
                        
                        btnPaguei.ontouchend = function() {
                            this.style.transform = 'scale(1)';
                            this.style.boxShadow = '0 4px 20px rgba(16, 185, 129, 0.5)';
                        };
                        
                        btnPaguei.onclick = async function(e) {
                            e.preventDefault();
                            
                            if (this.disabled) return;
                            
                            const textoOriginal = this.innerHTML;
                            this.innerHTML = '<i class="fas fa-spinner fa-spin" style="font-size: 20px;"></i><span style="font-size: 17px; font-weight: 700;">VERIFICANDO...</span>';
                            this.disabled = true;
                            this.style.opacity = '0.7';
                            
                            // Chama a função de verificação REAL
                            const pagamentoConfirmado = await verificarPagamento();
                            
                            // Restaura o botão
                            setTimeout(() => {
                                this.innerHTML = textoOriginal;
                                this.disabled = false;
                                this.style.opacity = '1';
                            }, 2000);
                        };
                        
                        // Adiciona os botões
                        inputPix.parentElement.appendChild(btnCopiar);
                        inputPix.parentElement.appendChild(btnPaguei);
                        
                        botoesAdicionados = true;
                        console.log('✅ Botões PIX melhorados adicionados!');
                    } catch (error) {
                        console.error('Erro ao melhorar botões PIX:', error);
                        esconderSpinner();
                    }
                }
                
                // Observa mudanças no DOM (backup)
                const observer = new MutationObserver(function(mutations) {
                    try {
                        interceptarBotaoDeposito();
                        // Só chama melhorarBotoesPix se não estiver com spinner ativo
                        if (!spinnerAtivo) {
                            melhorarBotoesPix();
                        }
                    } catch (error) {
                        console.error('Erro no observer:', error);
                    }
                });
                
                // Inicia observação quando o DOM carregar
                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', function() {
                        try {
                            observer.observe(document.body, {
                                childList: true,
                                subtree: true
                            });
                            interceptarBotaoDeposito();
                        } catch (error) {
                            console.error('Erro ao iniciar observer:', error);
                        }
                    });
                } else {
                    try {
                        observer.observe(document.body, {
                            childList: true,
                            subtree: true
                        });
                        interceptarBotaoDeposito();
                    } catch (error) {
                        console.error('Erro ao iniciar observer:', error);
                    }
                }
            } catch (error) {
                console.error('Erro fatal no script PIX:', error);
            }
        })();
    </script>
    <!-- ========================================================================= -->
    <!-- FIM DO SCRIPT BOTÕES PIX                                                  -->
    <!-- ========================================================================= -->

    @if (!empty($custom['custom_js']))
        <script>
            {!! $custom['custom_js'] !!}
        </script>
    @endif

    @if (!empty($custom['custom_body']))
        {!! $custom['custom_body'] !!}
    @endif

    @if (!empty($custom))
        <script>
            const custom = {!! json_encode($custom) !!};
        </script>
    @endif

</body>

</html>