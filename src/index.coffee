import Fastify from "fastify";

fastify = Fastify.fastify({ logger: true })

fastify.get "/", (_request, _reply) ->
  console.log "Hello, world!"
  { hello: "world" }

try
  fastify.listen { host: "0.0.0.0", port: 8000 }
catch error
  fastify.log.error error
  process.exit 1
