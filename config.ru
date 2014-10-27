$stdout.sync = true

use Rack::Static,
  :urls => ["/css", "/js", "/img"],
  :root => "."

run lambda { |env|
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'private, no-cache, max-age=0'
    },
    File.open('index.html', File::RDONLY)
  ]
}

