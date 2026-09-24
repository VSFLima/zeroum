<?php

namespace App\Filament\Admin\Pages;

use Filament\Pages\Page;
use Filament\Notifications\Notification;
use App\Models\CustomLayout;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;

class SelectThemePage extends Page
{
    protected static ?string $navigationLabel = 'Selecionar Tema';
    protected static ?string $title = 'Selecionar Tema';
    protected static string $view = 'filament.pages.select-theme';

    public ?string $selectedTheme = null;

    public function submit()
    {
        try {
            // Verifica se um tema foi selecionado
            if (!$this->selectedTheme) {
                Notification::make()
                    ->title('Por favor, selecione um tema.')
                    ->danger()
                    ->send();
                return;
            }

            // Aplica o tema selecionado
            $result = applyTheme($this->selectedTheme);

            if ($result) {
                // Notificação de sucesso
                Notification::make()
                    ->title('Tema aplicado com sucesso!')
                    ->body('As alterações foram aplicadas e salvas em tempo real.')
                    ->success()
                    ->send();
            } else {
                // Notificação de erro na aplicação do tema
                Notification::make()
                    ->title('Erro ao aplicar o tema. Tente novamente.')
                    ->danger()
                    ->send();
            }

            // Atualiza o cache (se necessário, use os dados alterados)
            $custom = CustomLayout::first();
            if ($custom) {
                Cache::put('custom', $custom);
            }
        } catch (Exception $exception) {
            // Notificação de erro genérico
            Notification::make()
                ->title('Erro ao aplicar o tema.')
                ->body('Ocorreu um problema durante o processo. Por favor, tente novamente.')
                ->danger()
                ->send();
        }
    }

    
}
