A minimal PHP project.

## Run

```bash
php -S localhost:8000 -t public
```

Open http://localhost:8000 or http://localhost:8000/?name=Bob.

## Structure

- `public/index.php` - web entry point
- `src/Greeter.php` - `MyApp\Greeter` class
- `composer.json` - metadata and PSR-4 autoload (`MyApp\` => `src/`)
