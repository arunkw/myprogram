;Purpose of this program is to bring automation to the desktop this is a fully customizable program
;This script is an autoit script(*.au3) which needs an needs autoit compiler
;List of features are mentioned at the end of this script
;How to compile this file
;0 Close any running instance of this program from killing it from system tray
;1 Run the program C:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2exe_x64.exe run in admin mode
;2 Mention this as the path of the file C:\Users\ADMIN\Dropbox\All Other Data\All Autoit scripts\myprogram.au3
;3 Put the exe file in this folder - "C:\Program Files\MyProgram.exe"
;4. Use the icon for exe file from here - %USERPROFILE%\Downloads\Temp Icon\541533.ico
#include <Process.au3>
#include <WinNet.au3>
#include <WinAPIFiles.au3>
#include <FileConstants.au3>
#include <Date.au3>
#include <Timers.au3>
#include <WinAPISys.au3>
#include <WinAPILocale.au3>
#include <APILocaleConstants.au3>
#include <File.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <Excel.au3>
#include <Sound.au3>
#include <TrayConstants.au3>
#include <GuiConstantsEx.au3>
#include <TabConstants.au3>
#include <ListViewConstants.au3>
#include <Excel.au3>
;#include <Chrome.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
Dim $voice = ObjCreate("Sapi.SpVoice")
;ID89-sn
Global $isGreyscaleOn = False
;ID89-en
Global	$longtime = 0
Global $sResult
_Main()
dim $search, $file, $var, $pflag,$connect
dim $Text, $Rate, $Vol, $long
dim $doscommandforrename
Func _Main() ; This is the main program
	Global $Paused
	Global $testing = false
    HotKeySet("+{ESC}", "_Quit")
	HotKeySet("`", "TogglePause")
    Local $starttime = _Timer_Init()
	Local $tTime
	Local $aTime
	$pflag = True
	; Get current system time
    $tTime = _Date_Time_GetSystemTime()
    $aTime = _Date_Time_SystemTimeToArray($tTime)
	Local $dumpweekdayhere = gettheweekday()
	if $testing = true then
	;Temp sandbox for testing

;CSID88-sn
If Not FileExists("C:\Program Files (x86)\AutoIt3\Include\GUIConstantsEx.au3") Then
    MsgBox(16, "Error", "GUIConstantsEx.au3 not found!")
    Exit
EndIf

Global $hGUI, $hGraphic, $hBrush, $hPen, $hFont
Global Const $PI = 3.1415926535897932384626433832795

$hGUI = GUICreate("", 400, 400, -1, -1, $WS_POPUP)
GUISetState(@SW_SHOW)

DrawClock()

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
WEnd
;CEID88-en

#CSID87-sn
Local $var = "C:\Users\ADMIN\Downloads\Temp Chrome Downloads\Daily Routine schedule.xlsx"
Local $oExcel_1 = _Excel_Open()
Local $oWorkbook = _Excel_BookOpen($oExcel_1, $var)
Local $_read = _Excel_RangeRead($oWorkbook,"Its time to","A1")
MsgBox(0,"Read",$_read)
#CEID87-en

#CSID84-sn-WIP

Local $sURL = "https://docs.google.com/spreadsheets/d/1ZSsGrvZ5LL1WhlGksxy-QG89mJzN-wWcb3ueBndWHVg/edit#gid=1467452766"
Local $oChrome = _WD_CreateSession("chrome", Default, Default, $sURL)

_WD_LoadWait($oChrome)

Local $oSheet = _WD_FindElement($oChrome, $_WD_LOCATOR_ByXPath, "//div[@id='sheeetname']")
Local $aTableData = _WD_TableRead($oSheet)

If @error Then
    MsgBox(0, "Error", "Error occurred while reading the table.")
    Exit
EndIf

Local $iRows = UBound($aTableData, $UBOUND_ROWS)
Local $iCols = UBound($aTableData, $UBOUND_COLUMNS)

For $iRow = 0 To $iRows - 1
    For $iCol = 0 To $iCols - 1
        ConsoleWrite($aTableData[$iRow][$iCol] & @TAB)
    Next
    ConsoleWrite(@CRLF)
Next

_WD_CloseSession($oChrome)


#CEID84-en

#CS-ID13-sn-WIP
; Use GUI Menu/Tabs/Listview to run various shortcuts
	Local $iMsg

	#Region GUI
	GUICreate("Things to do", 400, 400)
	GUISetIcon(@SystemDir & "\mspaint.exe", 0)
	#EndRegion GUI

	#Region MENU
	Local $idMenu1 = GUICtrlCreateMenu("&Default")
	Local $idMenu2 = GUICtrlCreateMenu("&See More")
	#forceref $idMenu2

	#EndRegion MENU

	#Region LIST VIEW
	Local $idListView = GUICtrlCreateListView("Sr No.|Description", 10, 10, 380, 320)
	GUICtrlSetTip(-1, '#Region LIST VIEW')
	GUICtrlCreateListViewItem("1|Start all the background programs", $idListView)
	GUICtrlCreateListViewItem("2|Stop all the backgound programs", $idListView)
	#EndRegion LIST VIEW

	#Region OK BUTTON
	Local $idOKButton = GUICtrlCreateButton("OK", 150, 340, 100, 25)
	#EndRegion OK BUTTON


	#Region GUI MESSAGE LOOP
	GUISetState(@SW_SHOW)
#CE-ID13-en

	else
;		Func_run_fastlane()
		While 1
			; Set the hotkey to listen for the shortcut key (e.g., ALT + A)
;ID84-sn
			HotKeySet("!a", "MyFunction")
;ID84-en
			; Infinite loop to keep the script running
;ID89-sn
			scaleandlayout()
;ID89-en
			TogglePause()
		WEnd
	EndIf ; endif for tesing
EndFunc   ;==>_Main

;ID89-sn
Func scaleandlayout()
; Get current time
Local $currentHour = @HOUR

; Check if the current time is between 6 PM and 6 AM
If $currentHour >= 18 Or $currentHour < 6 Then
    ChangeScaleAndLayout(125)
Else
    ChangeScaleAndLayout(100)
EndIf
EndFunc

Func ChangeScaleAndLayout($scale)
    ; Convert scale percentage to corresponding DPI setting
    Local $dpi
    Switch $scale
        Case 100
            $dpi = 96
        Case 125
            $dpi = 120
        ; Add more cases here if needed for other scales
        Default
            MsgBox($MB_ICONERROR, "Error", "Unsupported scale value: " & $scale)
            Return
    EndSwitch

	; Generate the PowerShell command to change the scale and layout
    Local $psCommand = 'powershell -command "Set-ItemProperty -Path ''HKCU:\Control Panel\Desktop'' -Name LogPixels -Value ' & $dpi & '; Stop-Process -ProcessName explorer"'

    ; Run the PowerShell command
    RunWait(@ComSpec & " /c " & $psCommand, "", @SW_HIDE)
EndFunc
;ID89-en

Func keybboardblock() ; This forces user to listen and blocks the keyboard inputs
;================== Block keyboard only Example ==================

HotKeySet("{ESC}", "_Quit") ;This will fail due to full keyboard blocking.

;Here we block only *Keyboard* input (without mouse).
_BlockInputEx(3)

;This is only for testing, so if anything go wrong, the script will exit after 10 seconds.
AdlibRegister("_Quit", 10000)

While 1
    Sleep(100)
WEnd
Endfunc

Func _GetNetworkConnect() ; Checks the internet connection
    Local Const $NETWORK_ALIVE_LAN = 0x1  ;net card connection
    Local Const $NETWORK_ALIVE_WAN = 0x2  ;RAS (internet) connection
    Local Const $NETWORK_ALIVE_AOL = 0x4  ;AOL

    Local $aRet, $iResult

    $aRet = DllCall("sensapi.dll", "int", "IsNetworkAlive", "int*", 0)

    If BitAND($aRet[1], $NETWORK_ALIVE_LAN) Then $iResult &= "LAN connected" & @LF
    If BitAND($aRet[1], $NETWORK_ALIVE_WAN) Then $iResult &= "WAN connected" & @LF
    If BitAND($aRet[1], $NETWORK_ALIVE_AOL) Then $iResult &= "AOL connected" & @LF

    Return $iResult
EndFunc

Func TogglePause(); Toggles the floating message
    $Paused = Not $Paused
	HotKeySet("'", "noTogglePause")
    While $Paused
;		Movemyfiles()

		if winactive("[CLASS:QWidget]")then
			Sleep(5000)
			Local $aPos = MouseGetPos()
				if $aPos[0] = 0 and winactive("[CLASS:QWidget]") then
					MsgBox($MB_SYSTEMMODAL, "", "oh, I see that. You are not Mr. Arun Kumar")
					MsgBox($MB_SYSTEMMODAL, "", "I am sorry, I will have to block you from using this computer")
					run("D:\Arun Dell\Desktop Files\Installers\ClearLock.exe","",@SW_MINIMIZE)
				endif
		else
		endif

		if WinExists("[CLASS:Chrome_WidgetWin_1]") then
			processclose("BitTorrent.exe")
		else
;			run("C:\Program Files (x86)\BitTorrent\BitTorrent.exe","",@SW_MINIMIZE)
		endif

		if ProcessExists("BitTorrent.exe") then
			WinClose("[CLASS:Chrome_WidgetWin_1]")
			processclose("WallpaperCycler Lite.exe")
			processclose("Everything.exe")
			processclose("C:\Program Files (x86)\TimeSnapper Classic\TimeSnapper.exe")
			processclose("C:\Users\dell\AppData\Roaming\7+ Taskbar Tweaker\7+ Taskbar Tweaker.exe")
			processclose("C:\Program Files (x86)\Belvedere\Belvedere.exe")
			processclose("C:\Program Files (x86)\Desktop Media\mediadetect.exe")
			processclose("C:\Program Files (x86)\Folder View\folderview.exe")
			processclose("C:\Program Files\Listary\Listary.exe")
			processclose("C:\Program Files (x86)\Speaking Clock\spclock.exe")
			processclose("C:\Program Files\IDT\WDM\sttray64.exe")
			processclose("C:\Program Files (x86)\4t Tray Minimizer\4t-min.exe")
			processclose("C:\Program Files\Everything\Everything.exe")
			processclose("C:\Program Files (x86)\Malwarebytes' Anti-Malware\mbam.exe")
			processclose("C:\Program Files (x86)\Workspace\workspaceupdate.exe")
			processclose("C:\Program Files\Microsoft Security Client\msseces.exe")
			processclose("C:\Users\dell\AppData\Local\Google\Update\GoogleUpdate.exe")
			processclose("C:\Users\dell\AppData\Local\Temp\FreeCommander6584\01\Splat.exe")
			processclose("C:\Program Files (x86)\Pidgin\pidgin.exe")
			processclose("C:\Program Files\Tomighty\tomighty-0.7.1.exe")
			processclose("C:\Program Files (x86)\Skynergy\HotKeyz\HotKeyz.exe")
		else
		endif

		if WinExists("[TITLE:VLC; CLASS:QWidget]") then
	;		MsgBox($MB_SYSTEMMODAL, "", "VLC is running")
			WinClose("[CLASS:SunAwtFrame]")
		else
	;		MsgBox($MB_SYSTEMMODAL, "", "VLC is not running")
;ID89-sn
    If @HOUR >= 23 And Not $isGreyscaleOn Then ; Check if current system time is more than 8pm and greyscale is not already on
        Send("^#c") ; Send key press combo of control key + Windows key + c key to turn Windows into greyscale
;        MsgBox($MB_OK, "Greyscale Activated", "Windows turned into greyscale mode.")
        $isGreyscaleOn = True ; Set the variable to indicate greyscale is on
    EndIf
;ID89-en

; Check the status of the Num Lock key
Local $numLockState = BitAND(DllCall("user32.dll", "int", "GetKeyState", "int", 0x90)[0], 0x01)

			; Display the Num Lock status
			If $numLockState Then
			;	MsgBox(64, "Num Lock Status", "Num Lock is ON")
				timeroutine()
			Else
			;	MsgBox(48, "Num Lock Status", "Num Lock is OFF")
			    ToolTip("")
			EndIf
			checkforwindowsandprocesses()
	;		idlecomputer()
		endif
    WEnd
    ToolTip("")
	HotKeySet("'", "TogglePause")
EndFunc   ;==>TogglePause

Func noTogglePause() ; supporting function for toggling
    $Paused = NOT $Paused ;; $Paused is False again so the loop in Loop() will terminate
EndFunc

Func idlecomputer() ; Execute stuff on idle time on computer
	if (_WinAPI_GetIdleTime ( ) /1000)> 300 then
		minimizefunction()
		Movemyfiles()
		killallprocesses()
	endif
Endfunc

Func minimizefunction() ; Minimize all the windows in idle time
	speak("Minimizing all the windows", 1, 100, false)
	SplashTextOn("", "Minimizing all windows", -1, -1, -1, -1, 32, "", 48)
	Sleep(3000)
	SplashOff()
	send("!{SPACE}n")
	send("{"ESC"}")
	WinMinimizeAll( )

EndFunc

Func Movemyfiles() ; Moves the file from desktop
						speak("Shifting all the files from desktop", 1, 100, false)
;						FileChangeDir ( "C:\Users\arunkumar.waghchoure\Downloads" )
;						$search = FileFindFirstFile("*.jpg")
;~ 						movefilesthrough()
						DirMove(@DesktopDir, "D:\Arun Dell\Desktop Files\Week"& _WeekNumberISO())
EndFunc

func runfoodporn() ; Displays images in random sequence
	Local $sDestination = randomfile()
;	 MsgBox(48, "Warning", $sDestination)
	speak("It is time for some food porn", 1, 100, false)
	SplashImageOn("", $sDestination, 1366, 768,0,0,1)
;	SplashImageOn("", $sDestination,,,,,1)
;	SplashImageOn("", $sDestination)
	WinSetTrans("Splash Screen", "", 500)
	Sleep(3000)
	SplashOff()
endfunc

func randomfile() ; Gets random files from specified folder
	$sDir = "D:\Arun Dell\Photos\Genral Category\food\"
	$aFiles = _FileListToArray($sDir, '*', 1)
    If @error = 1 Then
        MsgBox($MB_SYSTEMMODAL, "", "Path was invalid.")
        Exit
    EndIf
    If @error = 4 Then
        MsgBox($MB_SYSTEMMODAL, "", "No file(s) were found.")
        Exit
    EndIf


    If UBound($aFiles) > 1 Then
        $Index = Random(1, UBound($aFiles), 1)
        If $Index > UBound($aFiles) - 1 Then $Index = UBound($aFiles) - 1
;        MsgBox(262208, '', 'Current (Random) Index = ' & $Index & @LF & 'Array Elements Left = ' & UBound($aFiles))
	endif
    ; Display the results returned by _FileListToArray.
 ;   _ArrayDisplay($aFiles, "$aFiles")
;		MsgBox(262208, '', 'File Name  = ' & $aFiles[$Index])
	return $sDir & $aFiles[$Index]
Endfunc

Func _ArrayRandomShuffle(ByRef $aArray)
    Local $iRandom, $iBound = UBound($aArray) -1
    For $i = 0 To $iBound
        $iRandom = Random(0, $iBound, 1)
        If $i <> $iRandom Then _ArraySwap($aArray[$i], $aArray[$iRandom])
    Next
EndFunc

Func movefilesthrough() ;moves and organizes the files
	While 1
		$file = FileFindNextFile($search)
		MsgBox(0, "", @error)
		If @error Then
			ExitLoop
		Else
			SplashImageOn($file, $file,600,600)
			Sleep(3000)
			SplashOff()
			$var = FileSelectFolder("Choose a folder.", "F:\Arun\Photos\",1,"F:\Arun\Photos\")
			FileMove ( $file, $var,0)
		EndIf
	WEnd
	; Close the search handle
	FileClose($search)
EndFunc

Func subtimeroutine($passedrowcount)
	 if @HOUR = StringFormat("%02i",$sResult[$passedrowcount][2]) then
		 if @MIN < StringFormat("%02i",$sResult[$passedrowcount][3]) then
					ToolTip(StringFormat("%s",$sResult[$passedrowcount][0]),0,500,StringFormat("%s",$sResult[$passedrowcount][0]),0,4)
		endif
	endif
endfunc

Func getrecursiveindex($hourhere)
Local $aResult = _ArrayFindAll($sResult, $hourhere, Default, Default, Default, Default, 2)
if UBound($aResult,1) > 1 then
	For $i = UBound($aResult,1) To 1 Step -1
	Next
else
	return $aResult[0]
endif
endfunc

Func timeroutine() ; daily time routines
	Local $igotIndex
		Switch @WDAY
   			Case 2 to 7
   				Select
						MsgBox(48, "Warning", "Reached here1")
					Case @HOUR = 5 and (@MIN >= 30 and @MIN <=45)
						speak("It must be feeling great to get up early in the morning", 1, 100, false)
						ToolTip("Go to Toilet",0,500,"Non Committed Time",0,4)
					Case @HOUR = 5 and @MIN >= 45
						speak("It is time to change for exercise", 1, 100, false)
						ToolTip("It is time to change for exercise",0,500,"Non Committed Time",0,4)
					Case @HOUR = 6 and (@MIN >= 0 and @MIN <= 10)
						speak("It is time to hit the gym", 1, 100, false)
						ToolTip("It is time to hit the gym",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 6 and @MIN >= 10) or (@HOUR = 7 and @MIN <= 10)
						speak("It is time to do P90X or Zombie Run", 1, 100, false)
						ToolTip("P90X or Zombie Run",0,500,"Non Committed Time",0,4)
					Case @HOUR = 7 and (@MIN >= 10 and @MIN <= 20)
						speak("Back from the gym", 1, 100, false)
						ToolTip("Back from the gym",0,500,"Non Committed Time",0,4)
					Case @HOUR = 7 and (@Min >= 20 and @Min <= 40 )
						speak("It is time to have a bath", 1, 100, false)
						ToolTip("Bathing time",0,500,"Non Committed Time",0,4)
					Case @HOUR = 7 and (@Min >= 40 and @Min <= 55 )
						speak(" It is time to change cloths", 1, 100, false)
						ToolTip("Change Cloths",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 7 and @MIN >= 55) or  (@HOUR = 8 and @MIN >= 10)
						speak(" It is time for breakfast", 1, 100, false)
						ToolTip("Breakfast time",0,500,"Non Committed Time",0,4)
					Case @HOUR = 8 and(@MIN >= 10 and @MIN <= 20)
						speak("Read Newspaper", 1, 100, false)
						ToolTip("Read Newspaper",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 8 and @MIN >= 20) or (@HOUR = 9 and @MIN <= 5)
						speak("Read Blog", 1, 100, false)
						ToolTip("Read Blog",0,500,"Non Committed Time",0,4)
					Case @HOUR = 9 and(@MIN >= 5 and @MIN <= 15)
						speak(" Track share progress", 1, 100, false)
						ToolTip("Track share progress",0,500,"Committed Time",0,4)
					Case @HOUR = 9 and(@MIN >= 25 and @MIN <= 35)
						speak("It is time to do mind sweeping", 1, 100, false)
						ToolTip("Do mind sweep",0,500,"Committed Time",0,4)
					Case @HOUR = 9 and(@MIN >= 35 and @MIN <= 45)
						speak("It is time for expanding all project plans", 1, 100, false)
						ToolTip("Expanding all project plans",0,500,"Committed Time",0,4)
					Case (@HOUR = 9 and @MIN >= 45) or (@HOUR = 10 and @MIN <= 30)
						speak("It is time to check mail", 1, 100, false)
						ToolTip("Check mail",0,500,"Committed Time",0,4)
						;~ Open the gmail in chrome
					Case ((@HOUR = 10 and @MIN >= 30) or (@HOUR = 12 and @MIN <= 30 )) or @HOUR = 11
						speak("Work on the Project 1st Half Office", 1, 100, false)
						ToolTip("Work on the Project - 1st Half Office work",0,500,"Committed Time",0,4)
					Case (@Hour = 12 and @MIN >= 30) or (@Hour = 13 and @MIN >= 30)
						speak("Lunch", 1, 100, false)
						ToolTip("Lunch",0,500,"Committed Time",0,4)
;						runfoodporn()
					Case (@HOUR = 13 and @MIN >= 30) or (@HOUR = 16 and @MIN <= 30) or @HOUR = 14 or @HOUR = 15
						speak("Work on the Project - 2nd Half Office", 1, 100, false)
						ToolTip("Work on the Project - 2nd Half Office",0,500,"Committed Time",0,4)
					Case (@HOUR = 16 and @MIN >= 30) or (@HOUR = 17 and @MIN <= 30)
						speak("Execute Hot List", 1, 100, false)
						ToolTip("Execute Hot List",0,500,"Committed Time",0,4)
					Case (@HOUR = 17 and @MIN >= 30) or (@HOUR = 18 and @MIN <= 15)
						speak("It is time to execute recurring activities", 1, 100, false)
						ToolTip("Execute recurring activities",0,500,"Committed Time",0,4)
					Case @HOUR = 18 and @MIN >= 15
;						if $dailyreviewdone = false then
						SplashImageOn("", "C:\Users\dell\Desktop\Daily Review.jpg", 320, 768,0,0,1)
						Sleep(9000)
						$dailyreviewdone  = true
						SplashOff()
;						endif
						speak("Execute Tasks in Mulund Context", 1, 100, true)
						ToolTip("Execute Tasks in Mulund Context",0,500,"Committed Time",0,4)
					Case @HOUR = 18 and (@MIN >= 15 and @MIN <= 45 )
						speak("Execute tasks at Home", 1, 100, true)
						ToolTip("Execute Tasks at Home",0,500,"Committed Time",0,4)
					Case ((@HOUR = 18  and @MIN >= 45) or (@HOUR  = 21 and @MIN < 15)) or @HOUR = 19 or @HOUR = 20
						speak("Gap to do nothing", 1, 100, false)
						ToolTip("Gap to do nothing",0,500,"Committed Time",0,4)
					Case @HOUR = 21  and (@MIN >= 5 and @MIN <= 35)
						speak("It is time for dinner", 1, 100, false)
						ToolTip("Dinner time",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 21  and @MIN >= 35) or (@HOUR = 22 and @MIN <= 35)
						speak("It is time to talk to Wify", 1, 100, false)
						ToolTip("Talk to Wify",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 22  and @MIN >= 35) or (@HOUR = 23 and @MIN <= 35)
						speak("It is time for Book Reading", 1, 100, false)
						ToolTip("Book Reading",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 23  and @MIN >= 35) or (@HOUR = 23 and @MIN <= 45)
						speak("Use Elevate for learning", 1, 100, false)
						ToolTip("Use Elevate for learning",0,500,"Non Committed Time",0,4)
					Case (@HOUR = 23  and @MIN >= 45) or (@HOUR = 23 and @MIN <= 55)
						speak("Take the days review", 1, 100, false)
						ToolTip("Take the days review",0,500,"Non Committed Time",0,4)
#CE
				EndSelect
   			Case 1
			speak("It is Sunday today", 1, 100, true)
   			ToolTip("Sunday",0,500,"Non Committed Time",0,4)
   		EndSwitch
		Sleep(50000)


EndFunc

func killallprocesses() ; Kill all the processes

	Local $aArray[2] = ["Dropbox.exe","msces.exe"]
	For $i = 0 To UBound($aArray) - 1
		If ProcessExists($aArray[$i]) Then ; Check if the Notepad process is running.
			speak("Closing all the Process", 1, 100, false)
			SplashTextOn("", "Closing Process - " & $aArray[$i], -1, -1, -1, -1, 32, "", 48)
			Sleep(3000)
			SplashOff()
		Else
		EndIf
	Next
Endfunc

Func _Quit() ; key for quitting the program
	speak("Have a good day bye", 1, 100, false)
	SplashTextOn("", "Have a good day", -1, -1, -1, -1, 32, "", 48)
	Sleep(3000)
	SplashOff()
    Exit
EndFunc   ;==>_Quit

Func checkforwindowsandprocesses() ; check of the windows and process is running in task manager
	If ProcessExists("TimeSnapper.exe") Then ; Check if Time-snapper is running.
	Else
		SplashTextOn("", "Automatically Running Time Snapper in background", -1, -1, -1, -1, 32, "", 18)
		Run("C:\Program Files (x86)\TimeSnapper Classic\TimeSnapper.exe", "", @SW_MAXIMIZE)
	EndIf

    ; Test if the window exists and display the results.
    If WinExists("[CLASS:SunAwtFrame]") Then
    Else
    EndIf
	Sleep(3000)
	SplashOff()
EndFunc

Func runpomodoro() ; Run pomodoro
		Local $hWnd = WinWait("[CLASS:SunAwtFrame]", "", 10)
		WinSetOnTop($hWnd, "", 1)

		Local $iState = WinGetState($hWnd)
    ; Check if the Notepad window is minimized and display the appropriate message box.
		If BitAND($iState, 2) Then
		Else
			SplashTextOn("", "To Mighty is minimized" & @CRLF & "Run the next Pomodoro", -1, -1, -1, -1, 32, "", 14)
;			MsgBox($MB_SYSTEMMODAL, "", "To Mighty is minimized, Run the next Pomodoro" & $iState)
			WinFlash($hWnd, "", 4, 500)

		EndIf
EndFunc

Func speak($Text, $Rate, $Vol, $long) ; computer speaks out the message
	$voice.Rate = $Rate
	$voice.Volume = $Vol
	if $Paused then
	else
		if $long then
			if $longtime > 5 then
				$voice.speak($Text)
				$longtime = 0
			else
				$longtime = $longtime + 1
			endif
		else
			$voice.speak($Text)
		endif
	endif
EndFunc

Func gettheweekday() ; Show the weekday like monday, tuesday etc.
	Switch @WDAY
   		Case 1
	   		return("Sunday")
   		Case 2
	   		return("Monday")
   		Case 3
	   		return("Tuesday")
   		Case 4
	   		return("Wednesday")
   		Case 5
	   		return("Thursday")
   		Case 6
	   		return("Friday")
   		Case 7
	   		return("Saturday")
   	EndSwitch
EndFunc

; Define functions to be executed for each item
Func Func_For_First_Item()
    MsgBox(64, "First Item Selected", "Function for the first item executed.")
EndFunc

Func Func_For_Second_Item()
    MsgBox(64, "Second Item Selected", "Function for the second item executed.")
EndFunc

Func Func_For_OK_Button_Click()
    MsgBox(64, "OK Button Clicked", "OK button clicked.")
EndFunc

Func Func_run_fastlane()
		; Prompt the user to choose a lanes
		Local $iChoice = MsgBox($MB_YESNO, "Lane Selection", "Do you want to take the fast lane?")
		; Based on the user's choice, call the appropriate function
		If $iChoice = $IDNO Then
			; This is a fast lane
			TrayTip("Welcome Sir", "I am here to serve you", 30)
			$connect = _GetNetworkConnect()
			If $connect Then
			Else
				speak("There is no internet connection", 1, 100, false)
				MsgBox(48, "Warning", "There is no connection")
			EndIf
			SplashTextOn("", "Open Clockwork app on mobile" & @LF & "for pomodoro", -1, -1, -1, -1, 32, "", 18)
			Sleep(3000)
			SplashOff()
;ID83-sn
			run("C:\Users\ADMIN\AppData\Roaming\BitTorrent Web\btweb.exe","",@SW_MINIMIZE)
			run("C:\Program Files (x86)\Dropbox\Client\Dropbox.exe /systemstartup","",@SW_MINIMIZE)
			run("C:\Program Files\Google\Drive File Stream\89.0.2.0\GoogleDriveFS.exe --startup_mode","",@SW_MINIMIZE)
			run("C:\Windows\SysWOW64\Watchdata\PROXKey CSP India V3.0\SPSocketServer.exe","",@SW_MINIMIZE)
			run("C:\Windows\SysWOW64\Watchdata\PROXKey CSP India V3.0\SP_CertMND.exe","",@SW_MINIMIZE)
			run("C:\Program Files (x86)\eMudhra\emBridge\emBridge.exe startup","",@SW_MINIMIZE)
			run("C:\emSigner\emSigner\emSigner.exe","",@SW_MINIMIZE)
;ID83-en
		Else

		Local $ID = _WinAPI_GetUserGeoID()
		endif
EndFunc
;ID84-sn
Func MyFunction()
    MsgBox($MB_SYSTEMMODAL, "Shortcut Key Pressed", "The shortcut key was pressed!")
	Func_run_fastlane()
EndFunc
;ID84-en

;ID88-sn

Func DrawClock()
    ; Create a graphic object for drawing
    _GDIPlus_Startup()
    $hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

    ; Set the background color
    _GDIPlus_GraphicsClear($hGraphic, 0xFFFFFFFF)

    ; Draw clock face
    Local $iRadius = 150
    Local $iCenterX = 200, $iCenterY = 200
    $hBrush = _GDIPlus_BrushCreateSolid(0xFF000000) ; Black brush
    _GDIPlus_GraphicsFillEllipse($hGraphic, $iCenterX - $iRadius, $iCenterY - $iRadius, $iRadius * 2, $iRadius * 2, $hBrush)

    ; Draw clock hands
    Local $iHourHandLength = 80, $iMinuteHandLength = 120, $iSecondHandLength = 140
    Local $iHourAngle = _NowTime(1) * 30 + _NowTime(2) / 2
    Local $iMinuteAngle = _NowTime(2) * 6
    Local $iSecondAngle = _NowTime(3) * 6

    _DrawHand($iHourAngle, $iHourHandLength, 10, 0xFF000000)
    _DrawHand($iMinuteAngle, $iMinuteHandLength, 5, 0xFF000000)
    _DrawHand($iSecondAngle, $iSecondHandLength, 2, 0xFFFF0000)

    ; Release resources
    _GDIPlus_BrushDispose($hBrush)
    _GDIPlus_GraphicsDispose($hGraphic)
    _GDIPlus_Shutdown()
EndFunc

Func _DrawHand($iAngle, $iLength, $iWidth, $iColor)
    Local $iRadians = $iAngle * $PI / 180
    Local $iEndX = Cos($iRadians) * $iLength + 200
    Local $iEndY = Sin($iRadians) * $iLength + 200
    $hPen = _GDIPlus_PenCreate($iColor, $iWidth)
    _GDIPlus_GraphicsDrawLine($hGraphic, 200, 200, $iEndX, $iEndY, $hPen)
    _GDIPlus_PenDispose($hPen)
EndFunc

;ID88-en
