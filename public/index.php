
declare(strict_types=1);

require __DIR__ . '/../vendor/autoload.php';

use MyApp\Greeter;

$name = isset($_GET['name']) ? (string) $_GET['name'] : 'World';

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>myApp</title>
</head>
<body>
    <h1><?= htmlspecialchars((new Greeter())->greet($name), ENT_QUOTES, 'UTF-8') ?></h1>
</body>
</html>
