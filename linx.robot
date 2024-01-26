*** Settings ***
Library     SeleniumLibrary
Library     venv/lib/site-packages/robot/libraries/XML.py


*** Variables ***
${url}                 https://www.linx.com.br/  
${institucional}       //*[@id="body"]/header/div/div[2]/nav/ul/li[4]/a
${matriz}              //*[@id="body"]/header/div/div[2]/nav/ul/li[4]/div/ul/li[10]/a 
${carreira}            //*[@id="body"]/header/div/div[2]/nav/ul/li[4]/div/ul/li[3]/a    
${filial_cascavel}     Cascavel/PR
${filial_aparecida}    APARECIDA DE GOIANIA
${segmento}            //*[@id="topo"]/section[1]/div[2]/form/div[2]/div/div
${tecnologia_produto}  //*[@id="greenouse-segments"]/option[5]
${suporte}             Linx - Suporte


*** Keywords ***
Abrir Site 
    Open Browser               ${url}   
    Maximize Browser Window  

Acessar institucional 
    Click Element              ${institucional}
    Sleep                      1

Acessar Matriz    
    Click Link                 ${matriz}
    Sleep                      1

Acessar Carreira
    Click Link                 ${carreira}
    Sleep                      1

Filial Cascavel
    Page Should Contain        ${filial_cascavel}

Filial Aparecida
    Page Should Not Contain    ${filial_aparecida}

Filtrar linx - tecnologia e produto
    Click Element              ${segmento}
    Click Element              ${tecnologia_produto}

Verificar linx - suporte
    Page Should Not Contain    ${suporte}



*** Test Cases ***
Cenário 1: Acessar o site da Linx
    Abrir Site
    Acessar institucional
    Acessar Matriz

Cenário 2: Verificar se existe filial_cascavel
    Filial Cascavel

Cenário 3: Verificar se não existe filial_aparecida
    Filial Aparecida

Cenário 4: Voltar para a home do site 
    Go To    ${url}

Cenário 5: Acessar institucional > Carreira linx
    Acessar institucional 
    Acessar Carreira

Cenário 6: Filtrar pelo segmento Linx
    Filtrar linx - tecnologia e produto
    Verificar linx - suporte
