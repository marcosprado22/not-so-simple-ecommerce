# Not So Simple Ecommerce

## Docker Build

Devido a problemas de conectividade com o Microsoft Container Registry (MCR) no Docker Desktop, recomendamos usar GitHub Actions para construir as imagens Docker.

### Como usar:

1. Configure os secrets no repositório GitHub:
   - `DOCKER_USERNAME`: Seu nome de usuário do Docker Hub
   - `DOCKER_PASSWORD`: Seu token de acesso do Docker Hub

2. Faça push para a branch main ou abra um PR para acionar o workflow automaticamente.

3. A imagem será construída e enviada para o Docker Hub com a tag `seu-username/not-so-simple-ecommerce-main:latest`.

### Para desenvolvimento local:

Se precisar desenvolver localmente, considere usar uma VM Linux ou WSL2 com Docker Engine instalado diretamente (não Docker Desktop).

### Solução alternativa para problemas com MCR:

Para resolver os problemas de EOF com MCR no Docker Desktop, você pode:

1. Instalar Docker Engine diretamente no WSL2:
   ```bash
   wsl -d Ubuntu -- sudo apt update && sudo apt install -y docker.io
   ```

2. Configurar o Docker para usar o daemon do WSL2:
   ```bash
   echo 'export DOCKER_HOST=tcp://localhost:2375' >> ~/.bashrc
   ```

3. Iniciar o Docker no WSL2:
   ```bash
   sudo service docker start
   ```

### Status do projeto:

- ✅ Dockerfile corrigido para usar tags válidas do .NET 9.0
- ✅ Referências de projeto corrigidas (infraestructure → infraestructure)
- ✅ Dependências de pacotes adicionadas (Microsoft.AspNetCore.Http)
- ✅ Workflow do GitHub Actions criado para build na nuvem
- ✅ Build local funcionando (execute `.\build-local.bat`)
- ❌ Problema persistente com MCR no Docker Desktop local (use GitHub Actions)