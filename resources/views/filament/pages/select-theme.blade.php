<x-filament-panels::page>
    <form wire:submit.prevent="submit">
        <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-4">
            @foreach ([
                'pourple' => ['name' => 'Pourple', 'image' => 'pourple.png'],
                'black' => ['name' => 'Black', 'image' => 'black.png'],
                'blue' => ['name' => 'Blue', 'image' => 'blue.png'],
                'red' => ['name' => 'Red', 'image' => 'red.png'],
                'pink' => ['name' => 'Pink', 'image' => 'pink.png'],
                'limon' => ['name' => 'Limon', 'image' => 'limon.png'],
                'brown' => ['name' => 'Brown', 'image' => 'brown.png'],
                'skyblue' => ['name' => 'SkyBlue', 'image' => 'skyblue.png'],
                'whiteblue' => ['name' => 'WhiteBlue', 'image' => 'whiteblue.png'],
                'greendark' => ['name' => 'GreenDark', 'image' => 'greendark.png'],
                'orange' => ['name' => 'Orange', 'image' => 'orange.png'],
                'green' => ['name' => 'Green', 'image' => 'green.png'],
                'yellow' => ['name' => 'Yellow', 'image' => 'yellow.png'],
                'greenwhite' => ['name' => 'Greenwhite', 'image' => 'greenwhite.png'],
                'gray' => ['name' => 'Gray', 'image' => 'gray.png']
            ] as $key => $theme)
                <div class="border p-4 rounded text-center">
                    <h3 class="font-semibold text-lg mb-2">{{ $theme['name'] }}</h3>
                    <img src="{{ asset('storage/themes/' . $theme['image']) }}" alt="{{ $theme['name'] }}" class="mx-auto my-2 h-20 w-20 object-cover rounded-md">
                    <input type="radio" name="selectedTheme" value="{{ $key }}" wire:model="selectedTheme" />
                </div>
            @endforeach
        </div>

        <div class="mt-4">
            <x-filament::button type="submit">Aplicar Tema</x-filament::button>
        </div>
    </form>
</x-filament-panels::page>
