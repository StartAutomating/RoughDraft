FROM mcr.microsoft.com/powershell

RUN apt-get update && apt-get install -y git curl ca-certificates libc6 libgcc1 ffmpeg

ENV PSModulePath ./Modules
COPY . ./Modules/RoughDraft
RUN pwsh -c "New-Item -Path \$Profile -Value 'Import-Module RoughDraft' -Force"
