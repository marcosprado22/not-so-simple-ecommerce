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

Para resolver os problemas de EOF com MCR no Docker Desktop, você pode usar o Docker Engine dentro do WSL2.

#### Opção 1: usando Windows PowerShell ou CMD

Execute a partir do terminal do Windows:
```powershell
wsl.exe -d Ubuntu -- sudo apt update && sudo apt install -y docker.io
wsl.exe -d Ubuntu -- sudo service docker start
```

Isso instala e inicia o Docker dentro da distribuição Ubuntu do WSL2.

#### Opção 2: usando o shell Linux dentro do WSL

Se você já estiver no terminal Ubuntu do WSL, execute diretamente:
```bash
sudo apt update && sudo apt install -y docker.io
sudo service docker start
```

#### Configurar o Docker para usar o daemon do WSL2

No shell Ubuntu, adicione o host do Docker ao seu perfil:
```bash
echo 'export DOCKER_HOST=tcp://localhost:2375' >> ~/.bashrc
```

Em seguida, recarregue o perfil ou abra um novo terminal:
```bash
source ~/.bashrc
```

Se `wsl.exe` não for reconhecido no PowerShell/CMD, confirme que você está usando o terminal do Windows e não o shell do Ubuntu.

### Status do projeto:

- ✅ Dockerfile corrigido para usar tags válidas do .NET 9.0
- ✅ Referências de projeto corrigidas (infrastructure → infrastructure)
- ✅ Dependências de pacotes adicionadas (Microsoft.AspNetCore.Http)
- ✅ Workflow do GitHub Actions criado para build na nuvem
- ✅ Build local funcionando (execute `.\build-local.bat`)