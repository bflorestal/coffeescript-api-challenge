import Fastify from "fastify";

fastify = Fastify.fastify({ logger: true })

fastify.get "/", (_request, _reply) ->
  console.log "Hello, world!"
  { hello: "world" }

try
  fastify.listen { port: 8000 }
catch error
  fastify.log.error error
  process.exit 1
