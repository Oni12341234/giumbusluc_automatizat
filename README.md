
# Cum am preparat acest produs?

Pe scurt, am creat un WSB care ar trebui sa apeleze un script de Powershell care face doua chestii (upgradeaza Powershell la versiune mai noua - reduce timpu de la 30-40 min la vreo 7-8 si apeleaza scriptul propriul zis care instaleaza aplicatiile - Thunderbird si LibreOffice momentan ). 

Fisierul WSB nu contine mare lucru, doar mapeaza folderul si da drumul la jumpstart.ps1. Jumpstart-ul are doua comenzi cum am zis mai sus, iar giumbuslucul practic e un for-loop care descarca si instaleaza aplicatiile.

![image](https://github.com/user-attachments/assets/5a05092a-851d-48ce-97ab-a57ed9563b7f)


## Cum il pun la mine

In teorie, descarci efectiv fisierele schimbi primul path cu unde ai salvat tu fisierele si rulezi .wsb, dar sunt sanse sa se incarce ft greu in functie de instanta ta de sandbox. Momentan nu ai nevoie de jumpstart daca il incerci asa
    
## Cum ar trebui sa arate

In mod normal, ar trebui sa se deschida doar o instanta de CMD, care sa apeleze scriptul de jumpstart, iar apoi inca un window care ruleaza Powershell-ul, like this:

![image](https://github.com/user-attachments/assets/532c0229-327a-4d44-a706-8bd77ae9adb0)

## Ce mai am de imbunatatit + troubleshooting.


### Timpul de descarcare 
Aici m-am tot jucat cu curl, wget si irw dar cam toate duc cam la acelasi rezultat (am vazut ca irw e mai bun daca folosesc Powershell 7). In cazul in care nu ne convine timpul de rulare (10 min tops), trebuie sa gasim o alternativa la LibreOffice ca e destul de mare, fata de Thunderbird care se ia instant.
### De rezolvat de ce nu porneste din prima Logon command-ul in sandbox
Momentan, eu cand rulez sandbox-ul nu se intampla nimic, dar daca deschid un command prompt si dau fix comanda pe care o am si in WSB file, merge totul perfect (din nou, asta la mine local).
### De vazut cat de secure e asta -ExecutionPolicy Bypass
By default, nu merge sa rulez script-uri pe Sandbox, de asta e nevoie de optiunea asta. Trebuie sa ma mai uit sa vad cat de ok e sau daca pot sa modific sa fie cat mai secure.    
### De comentat cod
Aici daca e cazul sa mai pun niste comentarii ca sa putem sa adaugam aplicatii pe viitor fara sa citim iar codu 
