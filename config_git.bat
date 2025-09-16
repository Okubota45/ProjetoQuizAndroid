@echo off

git remote remove origin

git init

:: Inicializa o repositório git, se não for um repositório
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo Não é um repositório Git. Inicializando o repositório...
    git init
)

:: Configurações globais do Git
git config --global user.name "USER
"
git config --global user.email "EMAIL"

:: Adiciona o repositório remoto (só executa se já não estiver adicionado)
git remote get-url origin >nul 2>&1
if errorlevel 1 (
    git remote add origin "URL"
)


:: Remove atributos de oculto e de sistema de todos os arquivos e pastas
attrib -h -s "%folder%\*" /s /d

:: Mensagem de sucesso
echo Configurações do Git foram aplicadas com sucesso!
echo Arquivos ocultos na pasta atual foram exibidos.

pause

:: Deleta este próprio arquivo .bat
del "%~f0"