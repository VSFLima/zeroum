<?php

namespace App\Http\Livewire;

use Livewire\Component;

class DrakonLoader extends Component
{
    public $providerProgress = 0;
    public $gameProgress = 0;

    public function loadProviderDrakon()
    {
        $this->providerProgress = 0;

        // Simulação do processo de carregamento
        for ($i = 0; $i <= 100; $i++) {
            usleep(50000); // Simula o tempo de carregamento
            $this->providerProgress = $i;
            $this->emit('progressUpdated', $i);
        }

        // Seu código de carregamento real aqui
    }

    public function loadGamesDrakon()
    {
        $this->gameProgress = 0;

        // Simulação do processo de carregamento
        for ($i = 0; $i <= 100; $i++) {
            usleep(50000); // Simula o tempo de carregamento
            $this->gameProgress = $i;
            $this->emit('progressUpdated', $i);
        }

        // Seu código de carregamento real aqui
    }

    public function render()
    {
        return view('livewire.drakon-loader');
    }
}
