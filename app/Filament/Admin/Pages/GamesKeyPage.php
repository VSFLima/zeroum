<?php

namespace App\Filament\Admin\Pages;

use App\Models\GamesKey;
use App\Models\AproveSaveSetting; // Adicionado para verificação de senha
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Filament\Support\Exceptions\Halt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\HtmlString;

class GamesKeyPage extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static string $view = 'filament.pages.games-key-page';
    protected static ?string $title = 'Chaves dos Jogos';

    public ?array $data = [];
    public ?GamesKey $setting;

    public static function canAccess(): bool
    {
        return auth()->user()->hasRole('admin');
    }

    public function mount(): void
    {
        $gamesKey = GamesKey::first();
        if (!empty($gamesKey)) {
            $this->setting = $gamesKey;
            $this->form->fill($this->setting->toArray());
        } else {
            $this->form->fill();
        }
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([

                 //PLAY FIVER ADICIONAR ESSA LINHA DE CÓDIGO
                 Section::make('PLAYFIVER API')
                 ->description(new HtmlString('
                     <div style="display: flex; align-items: center;">
                         Nossa API fornece diversos jogos de slots e ao vivo. :
                         <a class="dark:text-white" 
                            style="
                                 font-size: 14px;
                                 font-weight: 600;
                                 width: 127px;
                                 display: flex;
                                 background-color: #f800ff;
                                 padding: 10px;
                                 border-radius: 11px;
                                 justify-content: center;
                                 margin-left: 10px;
                            " 
                            href="https://playfiver.app" 
                            target="_blank">
                             PAINEL PLAYFIVER
                         </a>
                         <a class="dark:text-white" 
                            style="
                                 font-size: 14px;
                                 font-weight: 600;
                                 width: 127px;
                                 display: flex;
                                 background-color: #f800ff;
                                 padding: 10px;
                                 border-radius: 11px;
                                 justify-content: center;
                                 margin-left: 10px;
                            " 
                            href="https://wa.me/+5545999057184" 
                            target="_blank">
                            SEU DEV
                         </a>
                     </div>
                 '))    
                 ->schema([
                 Section::make('CHAVES DE ACESSO PLAYFIVER')
                         ->description('Você pode obter suas chaves de acesso no painel da Playfiver ao criar o seu agente.')
                         ->schema([
                             TextInput::make('playfiver_code')
                                 ->label('CÓDIGO DO AGENTE')
                                 ->placeholder('Digite aqui o código do agente')
                                 ->maxLength(191),
 
                             TextInput::make('playfiver_token')
                                 ->label('AGENTE TOKEN')
                                 ->placeholder('Digite aqui o token do agente')
                                 ->maxLength(191),
                             TextInput::make('playfiver_secret')
                                 ->label('AGENTE SECRETO')
                                 ->placeholder('Digite aqui o código secreto do agente')
                                 ->maxLength(191),    
                         ])->columns(3),
                 ]),
                // Section::make('EverGame API')
                //     ->description('Ajustes de credenciais para a EverGame')
                //     ->schema([
                //         TextInput::make('evergame_agent_code')
                //             ->label('Agent Code')
                //             ->placeholder('Digite aqui o Agent Code')
                //             ->maxLength(191),
                //         TextInput::make('evergame_agent_token')
                //             ->label('Agent Token')
                //             ->placeholder('Digite aqui o Agent Token')
                //             ->maxLength(191),
                //         TextInput::make('evergame_api_endpoint')
                //             ->label('Api Endpoint')
                //             ->placeholder('Digite aqui a API Endpoint')
                //             ->maxLength(191)
                //             ->columnSpanFull(),
                //     ])
                //     ->columns(2),

                // Section::make('PARALELA EVERGAME CLONES DE 21')
                //     ->description('Ajustes de credenciais para a CLONES DE 21')
                //     ->schema([
                //         TextInput::make('evergame_secret_key2')
                //             ->label('SECRET KEY')
                //             ->placeholder('Digite aqui o SECRET KEY')
                //             ->maxLength(191),
                //         TextInput::make('evergame_agent_token2')
                //             ->label('Agent Token')
                //             ->placeholder('Digite aqui o Agent Token')
                //             ->maxLength(191),
                //         TextInput::make('evergame_api_endpoint2')
                //             ->label('Api Endpoint')
                //             ->placeholder('Digite aqui a API Endpoint')
                //             ->maxLength(191)
                //             ->columnSpanFull(),
                //     ])
                //     ->columns(2),

                // Section::make('API Infinity - CLONES')
                //     ->description('Ajustes de credenciais para a Infinity Soft')
                //     ->schema([
                //         TextInput::make('worldslot_agent_code')
                //             ->label('Agent Code')
                //             ->placeholder('Digite aqui o Agent Code')
                //             ->maxLength(191),
                //         TextInput::make('worldslot_agent_token')
                //             ->label('Agent Token')
                //             ->placeholder('Digite aqui o Agent Token')
                //             ->maxLength(191),
                //         TextInput::make('worldslot_agent_secret_key')
                //             ->label('Agent Secret Key')
                //             ->placeholder('Digite aqui o Agent Secret Key')
                //             ->maxLength(191),
                //         TextInput::make('worldslot_api_endpoint')
                //             ->label('Endpoint')
                //             ->placeholder('Digite aqui o Endpoint')
                //             ->maxLength(191)
                //             ->columnSpanFull(),
                //     ])
                //     ->columns(3),

                // Section::make('DRAKON API')
                //     ->description('Ajustes de credenciais para a DRAKON API')
                //     ->schema([
                //         TextInput::make('drakon_agent_code')
                //             ->label('Agent Code')
                //             ->placeholder('Digite aqui o Agent Code')
                //             ->maxLength(191),
                //         TextInput::make('drakon_agent_token')
                //             ->label('Agent Token')
                //             ->placeholder('Digite aqui o Agent Token')
                //             ->maxLength(191),
                //         TextInput::make('drakon_agent_secret')
                //             ->label('Agent Secret')
                //             ->placeholder('Digite aqui a Agente Secret')
                //             ->maxLength(191),
                //     ])
                //     ->columns(3),

                // Section::make('PlayConnection')
                //     ->description('Para adquirir creditos acesse')
                //     ->schema([
                //         TextInput::make('playconnect_code')
                //             ->label('Agent Code')
                //             ->placeholder('Digite aqui o Agent Code')
                //             ->maxLength(191),
                //         TextInput::make('playconnect_token')
                //             ->label('Agent Token')
                //             ->placeholder('Digite aqui o Agent Token')
                //             ->maxLength(191),
                //         TextInput::make('playconnect_secret_key')
                //             ->label('Agent Secret')
                //             ->placeholder('Digite aqui a Agente Secret')
                //             ->maxLength(191),
                //     ])->columns(3),

                //Section::make('API parceira PG')
                //    ->description('Ajustes de credenciais')
                //    ->schema([
                //       TextInput::make('agent_code')
                //           ->label('Agent Code')
                //           ->placeholder('Digite aqui o Agent Code')
                //           ->maxLength(191),
                //       TextInput::make('agent_token')
                //           ->label('Agent Token')
                //           ->placeholder('Digite aqui o Agent Token')
                //            ->maxLength(191),
                //       TextInput::make('agent_secret_key')
                //            ->label('Agent Secret Key')
                //            ->placeholder('Digite aqui o Agent Secret Key')
                //            ->maxLength(191),
                //        TextInput::make('api_endpoint')
                //            ->label('Api Endpoint')
                //            ->placeholder('Digite aqui a API Endpoint')
                //           ->maxLength(191)
                //           ->columnSpanFull(),
                //    ])
                //    ->columns(3),

                // Section::make('API parceira PG - PGSOFT')
                //     ->description('Ajustes de credenciais')
                //     ->schema([
                //         TextInput::make('agent_code_1')
                //             ->label('Agent Code')
                //             ->placeholder('Digite aqui o Agent Code')
                //             ->maxLength(191),
                //         TextInput::make('agent_token_1')
                //             ->label('Agent Token')
                //             ->placeholder('Digite aqui o Agent Token')
                //             ->maxLength(191),
                //         TextInput::make('agent_secret_key_1')
                //             ->label('Agent Secret Key')
                //             ->placeholder('Digite aqui o Agent Secret Key')
                //             ->maxLength(191),
                //         TextInput::make('api_endpoint_1')
                //             ->label('Api Endpoint')
                //             ->placeholder('Digite aqui a API Endpoint')
                //             ->maxLength(191)
                //             ->columnSpanFull(),
                //     ])
                //     ->columns(3),

                // Section::make('Play iGaming API')
                //     ->description('Compre direto com o representante Oficial Telegram: @playgamingB')
                //     ->schema([
                //         TextInput::make('play_gaming_hall')
                //             ->label('Hall')
                //             ->placeholder('Digite aqui sua Hall')
                //             ->maxLength(191),
                //         TextInput::make('play_gaming_key')
                //             ->label('Key')
                //             ->placeholder('Digite aqui a sua Key')
                //             ->maxLength(191),
                //         TextInput::make('play_gaming_login')
                //             ->label('Login')
                //             ->placeholder('Digite aqui o Login')
                //             ->maxLength(191),
                //     ])
                //     ->columns(3),

                // Adicionando seção para digitar a senha de aprovação
                Section::make('Digite a senha de confirmação')
                    ->description('Obrigatório digitar sua senha de confirmação!')
                    ->schema([
                        TextInput::make('approval_password_save')
                            ->label('Senha de Aprovação')
                            ->password()
                            ->required()
                            ->helperText('Digite a senha para salvar as alterações.')
                            ->maxLength(191),
                    ])->columns(3),
            ])
            ->statePath('data');
    }

    public function submit(): void
    {
        try {
            if (env('APP_DEMO')) {
                Notification::make()
                    ->title('Atenção')
                    ->body('Você não pode realizar esta alteração na versão demo')
                    ->danger()
                    ->send();
                return;
            }

            // Verificação da senha
            $approvalSettings = AproveSaveSetting::first();
            $inputPassword = $this->data['approval_password_save'] ?? '';

            if (!Hash::check($inputPassword, $approvalSettings->approval_password_save)) {
                Notification::make()
                    ->title('Erro de Autenticação')
                    ->body('Senha incorreta. Por favor, tente novamente.')
                    ->danger()
                    ->send();
                return;
            }

            $setting = GamesKey::first();

            if (!empty($setting)) {
                if ($setting->update($this->data)) {
                    Notification::make()
                        ->title('Chaves Alteradas')
                        ->body('Suas chaves foram alteradas com sucesso!')
                        ->success()
                        ->send();
                }
            } else {
                if (GamesKey::create($this->data)) {
                    Notification::make()
                        ->title('Chaves Criadas')
                        ->body('Suas chaves foram criadas com sucesso!')
                        ->success()
                        ->send();
                }
            }
        } catch (Halt $exception) {
            Notification::make()
                ->title('Erro ao alterar dados!')
                ->body('Erro ao alterar dados!')
                ->danger()
                ->send();
        }
    }
}
