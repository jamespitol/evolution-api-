# Usando a imagem oficial da Evolution API
FROM atendai/evolution-api:v2.2.3

# Definindo as variáveis de ambiente
ENV AUTHENTICATION_API_KEY=${AUTHENTICATION_API_KEY} \
    DATABASE_PROVIDER=${DATABASE_PROVIDER} \
    DATABASE_CONNECTION_URI=${DATABASE_CONNECTION_URI} \
    DATABASE_ENABLED=${DATABASE_ENABLED} \
    DATABASE_SAVE_DATA_INSTANCE=${DATABASE_SAVE_DATA_INSTANCE} \
    DATABASE_SAVE_DATA_NEW_MESSAGE=${DATABASE_SAVE_DATA_NEW_MESSAGE} \
    DATABASE_SAVE_MESSAGE_UPDATE=${DATABASE_SAVE_MESSAGE_UPDATE} \
    DATABASE_SAVE_DATA_CONTACTS=${DATABASE_SAVE_DATA_CONTACTS} \
    DATABASE_SAVE_DATA_CHATS=${DATABASE_SAVE_DATA_CHATS} \
    DATABASE_SAVE_DATA_LABELS=${DATABASE_SAVE_DATA_LABELS} \
    DATABASE_SAVE_DATA_HISTORIC=${DATABASE_SAVE_DATA_HISTORIC} \
    CACHE_REDIS_ENABLED=${CACHE_REDIS_ENABLED} \
    CACHE_REDIS_URI=${CACHE_REDIS_URI} \
    CACHE_REDIS_PREFIX_KEY=${CACHE_REDIS_PREFIX_KEY} \
    CACHE_REDIS_SAVE_INSTANCES=${CACHE_REDIS_SAVE_INSTANCES} \
    CACHE_LOCAL_ENABLED=${CACHE_LOCAL_ENABLED} \
    REDIS_HOST=${REDIS_HOST} \
    REDIS_PORT=${REDIS_PORT} \
    REDIS_PASSWORD=${REDIS_PASSWORD}

FROM n8nio/n8n:latest

USER root

# Add all your packages here
RUN apk update && \
    apk add --no-cache ffmpeg

USER node

# Expondo a porta da aplicação
EXPOSE 8080

# Comando para diagnóstico e execução
CMD ["sh", "-c", "redis-cli -u $CACHE_REDIS_URI ping && npm run start:prod"]
