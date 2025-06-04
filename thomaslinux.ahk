; configuration
cord := "Cordialement,{Enter}Thomas"
::cord:: {
Send cord
}

; Correcteur
:**:é  ::É
:*C:A :: {
Send "À "
}
:**:Etait::Était
:**:bjr ::Bonjour,
:C:Ca::Ça

; Speakers/Heaphones/Output Controls/Multimedia
#WheelUp::Send "{Volume_Up 2}"	    ; #Winkey + Scroll mouse wheel up = increase volume
#WheelDown::Send "{Volume_Down 2}"	; #Winkey + Scroll mouse wheel down = decrease volume
#MButton::Volume_Mute	              ; #Winkey + Pressing mouse wheel = mute speakers
; Bascule sur la fenêtre YouTube Music, met pause à la musique avec Espace, retourne sur la fenêtre précédente
CapsLock & Space:: {
WinExist("A")               ; Enregistre la fenêtre actuelle pour WinActivate
Sleep 50
WinActivate "Music"         ; Passe sur la fenêtre de YouTube Music
Sleep 50
SendInput "{Space}"         ; Appuie sur Espace pour mettre en pause
Sleep 50
; SendInput "{Media_Play_Pause}"
WinActivate                 ; retourne sur la fenêtre précédente
}
CapsLock & "::Media_Next    ; passe à la musique suivante
CapsLock & é::Media_Prev    ; passe à la musique précédente

; Verr Maj devient utile
CapsLock & A:: {
Send(FormatTime(A_Now, "/MM/yyyy"))          ; insère le mois et l'année
}
CapsLock & &:: {
Send(FormatTime(A_Now, "dd/MM/yyyy HH:mm"))  ; insère la date du jour
}
CapsLock & V:: {
Send(A_Clipboard)                            ; insère le presse-papier sans mise en forme en simulant l'écriture de caractères
}
CapsLock & B:: {
Send(StrUpper(A_Clipboard))                  ; insère le presse-papier en majuscules
}
CapsLock & C:: {
Send(StrLower(A_Clipboard))                  ; insère le presse-papier en minuscules
}
CapsLock & X:: {
Send(
SubStr(A_Clipboard, 1, 1)                    ; insère la première lettre du presse-papier
SubStr(StrLower(A_Clipboard),2)              ; insère le reste des lettres du presse-papier en minuscules
)
}
CapsLock & D:: {
if WinExist("cmd")
; if WinExist("ahk_exe WindowsTerminal.exe")   ; pour Windows 11
    WinActivate                              ; bascule sur la fenêtre du cmd actuellement ouverte
else
	  Run 'cmd /k cd "C:\Users\%username%\'    ; ouvre la fenêtre du CMD dans le dossier utilisateur
CapsLock & N:: {
if WinExist("OneNote")
    WinActivate                              ; bascule sur la fenêtre de OneNote actuellement ouverte
else
	Run "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"     ; lance OneNote
}
CapsLock & T:: {
if WinExist("teamviewer")
    WinActivate                              ; bascule sur la fenêtre de TeamViewer actuellement ouverte
else
	Run "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"                ; lance TeamViewer
}
CapsLock & W:: {
Run "shell:startup"                          ; ouvre le dossier shell:startup dans explorer
}
CapsLock & E:: {
	  Run 'explorer "C:\Users\%username%\'     ; ouvre le dossier utilisateur   dans explorer
}
CapsLock & F:: {                             ; ouvre le script autohotkey dans Notepad++
    Run '"C:\Program Files\Notepad++\notepad++.exe" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\thomaslinux.ahk'
}
CapsLock & Z {                               ; envoie le texte Hello Wold
SendText "Hello World"
}
; 2 pour supprimer
²::Del

; tranparency
; WinSetTransparent 254, "ahk_exe msedge.exe"
; WinSetTransparent 254, "ahk_class Chrome_WidgetWin_1"

; si la fenêtre est Google Chrome
#HotIf WinActive("ahk_exe chrome.exe")

#HotIf WinActive("ahk_exe msedge.exe")
; Verr Maj devient utile
CapsLock & A:: {
; Send(FormatTime(A_Now, "/MM/yyyy"))
SendText "example"
}

#HotIf WinActive("ahk_exe WindowsTerminal.exe")
CapsLock & Z:: {
SendText "user "
Send(A_Clipboard)
}
CapsLock & E:: {
SendText "checkin "
Send(A_Clipboard)
}
; 2 pour supprimer
²:: {
Send "{Ctrl & BS}"
}
MButton:: {
Send(A_Clipboard)
}

#HotIf
