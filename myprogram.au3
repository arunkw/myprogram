;Purpose of this program is to bring automation to the desktop this is a fully customizable program
;This script is an autoit script(*.au3) which needs an needs autoit compiler
;List of features are mentioned at the end of this script
;How to compile this file 
;1 Run the program C:\Program Files (x86)\AutoIt3\Aut2Exe\Aut2exe_x64.exe
;2 Mention this as the path of the fine D:\Arun Dell\Other Files\Autoit scripts\myprogram.au3
#include <Process.au3>
;#include <ACN_BlockInputEx.au3> ; Error in opening the file
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
Dim $voice = ObjCreate("Sapi.SpVoice")
Global	$longtime = 0
Global $sResult
_Main()

dim $search, $file, $var, $pflag,$connect 
dim $Text, $Rate, $Vol, $long
dim $doscommandforrename

;~ Min Hotkeyz window

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

;						if (_WinAPI_CreateDirectory("D:\Arun Dell\Desktop Files\Week "& _WeekNumberISO())) then
;	If Not _WinAPI_MoveFileEx(@DesktopDir, "D:\Arun Dell\Desktop Files\Week"&_WeekNumberISO(),$MOVE_FILE_COPY_ALLOWED) Then
;	EndIf						
;						_RunDos ("D:")
;						_RunDos ("cd D:\Arun Dell\Desktop Files")
;						$doscommandforrename = "ren Week"&_WeekNumberISO()&" Week_"&_WeekNumberISO()&" "
;						if _RunDos ($doscommandforrename) = 0 then
;							MsgBox(64, "Dos Command", @error)
;						endif
;						endif
	Local $dumpweekdayhere = gettheweekday()
;	MsgBox(64, "|"&$dumpweekdayhere&"|", "|"&$dumpweekdayhere&"|")
	if $testing = true then
	else
		TrayTip("Welcome Sir", "I am here to serve you", 30)	
;		SplashTextOn("", "Good Morning sir today is "& $dumpweekdayhere &" Date "& $aTime[1], -1, -1, -1, -1, 32, "", 18)
;		speak("Good Morning sir today is" & String($dumpweekdayhere), 1, 100, false)
;		speak(gettheweekday(),1,100,false)	
;		Sleep(3000)
;		SplashOff()
		$connect = _GetNetworkConnect()
;
		If $connect Then
;			SplashTextOn("", "Internet here is working fine", -1, -1, -1, -1, 32, "", 18)
;			speak("Internet here is working fine", 1, 100, false)
;			Sleep(3000)
;			SplashOff()
		;~    MsgBox(64, "Connections", $connect)
		Else
			speak("There is no internet connection", 1, 100, false)
			MsgBox(48, "Warning", "There is no connection")
		EndIf

		SplashTextOn("", "Open Clockwork app on mobile" & @LF & "for pomodoro", -1, -1, -1, -1, 32, "", 18)
;		speak("Open Clockwork app on mobile for pomodoro", 1, 100, false)
		Sleep(3000)
		SplashOff()
		
		
;		SplashImageOn("", "D:\Arun Dell\Photos\Personal Category\Text\Show\cruise control copy.jpg", 1366, 768,0,0,1)
;		Sleep(9000)
;		SplashOff()		


		
		Local $ID = _WinAPI_GetUserGeoID()
		;if 	((ConsoleWrite('ID:        0x' & Hex($ID) & @CRLF) = 23) and (ConsoleWrite('Latitude:  ' & ;_WinAPI_GetGeoInfo($ID, $GEO_LATITUDE) & @CRLF) = 18) and (ConsoleWrite('Longitude: ' & ;_WinAPI_GetGeoInfo($ID, $GEO_LONGITUDE) & @CRLF) = 20) and (ConsoleWrite('Name:      ' & ;_WinAPI_GetGeoInfo($ID, $GEO_FRIENDLYNAME) & @CRLF) = 26) and (ConsoleWrite('ISO code:  ' & ;_WinAPI_GetGeoInfo($ID, $GEO_ISO3) & @CRLF) = 16)) then
		;		SplashTextOn("", "Welcome to The Playce", -1, -1, -1, -1, 32, "", 28) 
		;		Sleep(3000)
		;		SplashOff()
		;endif	

	endif	; endif for tesing		
		; 1.Open the Excel file - Done
		; 2. Read a record or value from sheet
		; 2. Read the data into array
		; 3. Use the array in the checking condition
		; Create application object and open an example workbook
#CS
		Local $oAppl = _Excel_Open()
		If @error Then 
			MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example", "Error creating the Excel application object." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
			Exit 
		endif 

		Local $oWorkbook = _Excel_BookOpen($oAppl,"C:\Users\dell\Google Drive\Excel Collection\Daily Routine Iphone Mobile App time management[Conflict].XLS",true,false)
		If @error Then
			MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example", "Error opening workbook '" & @ScriptDir & "\Extras\_Excel1.xls'." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
			_Excel_Close($oAppl)
			Exit
		EndIf
		; *****************************************************************************
		; Read data from a single cell on the active sheet of the specified workbook
		; *****************************************************************************
		$sResult = _Excel_RangeRead($oWorkbook, Default, "AP3:AS30")
;		_ArrayDisplay($sResult, "Whats in the Excel sheet")
		If @error Then 
			MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example 1", "Error reading from workbook." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
			MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_RangeRead Example 1", "Data successfully read." & @CRLF & "Value of cell A1: " & $sResult)
			Exit
		endif
;		_Excel_Close($oAppl)
#CE
    While 1
		TogglePause()
	WEnd
EndFunc   ;==>_Main

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
			timeroutine()
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

;~ 						If $search = -1 Then
;~ 							MsgBox(0, "Error", "No files/directories matched the search pattern")
;~ 							Exit
;~ 						EndIf

						While 1
							
							;~ if title = ECD(1)/000 send key for user id and password
							$file = FileFindNextFile($search)
								MsgBox(0, "", @error)
							If @error Then
								ExitLoop
							Else
;~ 								Local $aArray1 = _StringBetween('[18][20][3][5][500][60]', '[', ']')
;~ 								if jpg then
									SplashImageOn($file, $file,600,600)
									Sleep(3000)
									SplashOff()
;~ 								ElseIf
;~ 								If pdf then
;~ 									$handle = FileOpen($file, 0)
;~ 									Sleep(3000)
;~ 									FileClose($handle)
;~ 								endif
									$var = FileSelectFolder("Choose a folder.", "F:\Arun\Photos\",1,"F:\Arun\Photos\")
									FileMove ( $file, $var,0)				
							EndIf
						WEnd
						; Close the search handle
						FileClose($search)
EndFunc

Func subtimeroutine($passedrowcount)
;	MsgBox(48, "Warning", "We are here")
;	Local $brokentime = StringSplit($sResult[$passedrowcount,3],":")
;	MsgBox(48, "HOUR", @HOUR)
;	MsgBox(48, "MIN", @MIN)
;	MsgBox(48, "Row count", $passedrowcount)	
;	_ArrayDisplay($sResult, "Whats in the Excel sheet")
;	MsgBox(48, "Hour from sheet", $sResult[$passedrowcount][2])
;	MsgBox(48, "Min from sheet", $sResult[$passedrowcount][3])
	 if @HOUR = StringFormat("%02i",$sResult[$passedrowcount][2]) then
;	MsgBox(48, "Warning", "We are here")	 x
		 if @MIN < StringFormat("%02i",$sResult[$passedrowcount][3]) then
;	MsgBox(48, "Warning", $sResult[$passedrowcount][0])	 		 
;			 ToolTip($sResult[$passedrowcount][0])
					ToolTip(StringFormat("%s",$sResult[$passedrowcount][0]),0,500,StringFormat("%s",$sResult[$passedrowcount][0]),0,4)			 
;			exit
		endif
	endif
endfunc

Func getrecursiveindex($hourhere)
;	$iIndex = _ArrayBinarySearch($sResult, $hourhere, 0, 0, 2)
Local $aResult = _ArrayFindAll($sResult, $hourhere, Default, Default, Default, Default, 2)
;; There check for the error and then start the for loop with countdown
;_ArrayDisplay($aResult, "Display")
;MsgBox(48, "Ubound", UBound($aResult,1))
if UBound($aResult,1) > 1 then
	For $i = UBound($aResult,1) To 1 Step -1
;		if @MIN < $aResult[$i] then
;			return $aResult[$i]
;		else
;		endif
	Next
else
;	$iIndex = _ArrayBinarySearch($sResult, $aResult[0], 0, 0, 3)
;	MsgBox(48, "Row count", $aResult[0])
	return $aResult[0]
endif
endfunc

Func timeroutine() ; daily time routines
	Local $igotIndex
;	Local $rowcount = 1
;	 MsgBox(48, "Warning", _WinNet_GetResourceParent)
		Switch @WDAY
   			Case 2 to 7

;				_ArrayDisplay($sResult, "Whats in the Excel sheet")
;				$igotIndex = getrecursiveindex(@HOUR)
;				ToolTip(StringFormat("%s",$sResult[$igotIndex][0]),0,500,StringFormat("%s",$sResult[$igotIndex][0]),0,4)
#CS
				if @HOUR < 6 then
					ToolTip("Go to Sleep",0,500,"Non Committed Time",0,4)
				endif
				if @HOUR < 12 then
					for $rowcount = 2 to 14 step 1
;						subtimeroutine($rowcount)
;						MsgBox(48, "HOUR", @HOUR)
;						MsgBox(48, "Cell", $sResult[$rowcount][2])
						if @HOUR = StringFormat("%i",$sResult[$rowcount][2])then
							if @MIN < StringFormat("%02i",$sResult[$rowcount][3]) then
								ToolTip(StringFormat("%s",$sResult[$rowcount][0]),0,500,StringFormat("%s",$sResult[$rowcount][0]),0,4)
								ExitLoop
							endif
						else
						endif
					Next
				else
					for $rowcount = 15 to 27
;						subtimeroutine($rowcount)
						MsgBox(48, "HOUR", @HOUR)
						MsgBox(48, "Cell", $sResult[$rowcount][2])					
;						subtimeroutine($rowcount)
						if @HOUR = StringFormat("%02i",$sResult[$rowcount][2]) then
							if @MIN < StringFormat("%02i",$sResult[$rowcount][3]) then
								ToolTip(StringFormat("%s",$sResult[$rowcount][0]),0,500,StringFormat("%s",$sResult[$rowcount][0]),0,4)
								ExitLoop
							endif
						endif						
					Next
				endif			
#CE				
				

   				Select
						MsgBox(48, "Warning", "Reached here1")				
					Case @HOUR = 5 and (@MIN >= 30 and @MIN <=45)	
						speak("It must be feeling great to get up early in the morning", 1, 100, false)
					;	ToolTip("Feels Great to get up early Good Morning",0,500,"Non Committed Time",0,4)
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
;							for $i = 500 to 1000 step 1
;							    MsgBox(64, "Value", $i)								
;								ToolTip("Work on the Project - 2nd Half Office",0,$i,"Committed Time",0,4)
;								sleep (50)
;							next
					Case (@HOUR = 16 and @MIN >= 30) or (@HOUR = 17 and @MIN <= 30)	
						speak("Execute Hot List", 1, 100, false)
						ToolTip("Execute Hot List",0,500,"Committed Time",0,4)
					Case (@HOUR = 17 and @MIN >= 30) or (@HOUR = 18 and @MIN <= 15)
						speak("It is time to execute recurring activities", 1, 100, false)
						ToolTip("Execute recurring activities",0,500,"Committed Time",0,4)
					Case @HOUR = 18 and @MIN >= 15
						if $dailyreviewdone = false then
						SplashImageOn("", "C:\Users\dell\Desktop\Daily Review.jpg", 320, 768,0,0,1)
						Sleep(9000)
						$dailyreviewdone  = true
						SplashOff()		
						endif
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



#CS 	If @WDAY = 1  Then
   	
   	
   	Else
   		if @WDAY = 7 Then
   			
   		Else
   			IF @HOUR <= 6 Then
   					ToolTip("Time to sleep",0,500,"Time to sleep",0,4)
   					Sleep(50000)
   			Else
   				IF @HOUR >= 23 Then
   					if @MIN >= 30 Then
   						ToolTip("Time to sleep",0,500,"Time to sleep",0,4)
   						Sleep(50000)
   					Else
   						ToolTip("Dinner time",0,500,"Dinner time",0,4)
   						Sleep(50000)					
   					EndIf
   				else	
   						IF @HOUR >= 22 Then
   							if @MIN >= 30 Then
   								ToolTip("Dinner time",0,500,"Dinner time",0,4)
   								Sleep(50000)
   							Else
   								ToolTip("Time to go home",0,500,"Time to go home",0,4)
   								Sleep(50000)
   							EndIf
   						Else	 	
   							IF @HOUR > 18 Then
   								if @HOUR = 18 And @MIN < 30 Then
   									ToolTip("Office time",0,500,"Office time",0,4)
   									Sleep(50000)
   								Else
   									ToolTip("Time to go home",0,500,"Time to go home",0,4)
   									Sleep(50000)
   								EndIf			
   							Else
   								if @HOUR >= 15 Then
   									if @MIN >= 30 Then
   										ToolTip("Tea time",0,500,"Tea time",0,4)
   										Sleep(50000)
   									Else
   										ToolTip("Office time",0,500,"Office time",0,4)
   										Sleep(50000)									
   									EndIf
   								Else
   									if @HOUR >= 13 Then
   										if @MIN >= 30 Then
   											ToolTip("Lunch time",0,500,"Lunch time",0,4)
   											Sleep(50000)									
   										Else
   											ToolTip("Welcome to Office",0,500,"Welcome to Office",0,4)
   											Sleep(50000)										
   										EndIf
   									Else
   										IF @HOUR >= 9 Then
   												ToolTip("Welcome to Office",0,500,"Welcome to Office",0,4)
   												Sleep(50000)
   										Else	
   											IF @HOUR >= 8 Then
   													ToolTip("Go to Office",0,500,"Go to Office",0,4)
   													Sleep(50000)
   											Else
   												IF @HOUR >= 7 Then
   													if @Min <= 30 Then
   														ToolTip("Bathing time",0,500,"Bathing time",0,4)
   														Sleep(50000)
   													Else
   														
   														ToolTip("Breakfast time",0,500,"Breakfast time",0,4)
   														Sleep(50000)
   													EndIf
   												Else
   														IF @HOUR >= 6 Then
   																ToolTip("Excercise",0,500,"Excercise",0,4)
   																Sleep(50000)
   														EndIf
   												EndIf
   											EndIf				
   										EndIf					
   									EndIf
   								EndIf	
   							EndIf
   						EndIf			
   					EndIf	
   				EndIf
   			EndIf
   		EndIf	
#CE
		
EndFunc	

func killallprocesses() ; Kill all the processes

	Local $aArray[2] = ["Dropbox.exe","msces.exe"]
	For $i = 0 To UBound($aArray) - 1
		If ProcessExists($aArray[$i]) Then ; Check if the Notepad process is running.
;			MsgBox($MB_SYSTEMMODAL, "", "Notepad is running")
			speak("Closing all the Process", 1, 100, false) 
			SplashTextOn("", "Closing Process - " & $aArray[$i], -1, -1, -1, -1, 32, "", 48)
			Sleep(3000)
			SplashOff()
		Else
;			MsgBox($MB_SYSTEMMODAL, "", "Notepad is not running")
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
;		MsgBox($MB_SYSTEMMODAL, "", "Run Time Snapper")
		SplashTextOn("", "Automatically Running Time Snapper in background", -1, -1, -1, -1, 32, "", 18)
		Run("C:\Program Files (x86)\TimeSnapper Classic\TimeSnapper.exe", "", @SW_MAXIMIZE)
	EndIf
	
    ; Test if the window exists and display the results.
    If WinExists("[CLASS:SunAwtFrame]") Then
;		runpomodoro()
    Else
;        MsgBox($MB_SYSTEMMODAL, "", "Run To Mighty for Pomodoro")
;		SplashTextOn("", "Automatically Running" & @CRLF &"To Mighty for Pomodoro", -1, -1, -1, -1, 32, "", 14)
;		Run("C:\Program Files\Tomighty\tomighty-0.7.1.exe", "", @SW_SHOWMAXIMIZED)
;		runpomodoro()
    EndIf
	Sleep(3000)
	SplashOff()
EndFunc

Func runpomodoro() ; Run pomodoro
		Local $hWnd = WinWait("[CLASS:SunAwtFrame]", "", 10)
		WinSetOnTop($hWnd, "", 1)
;		WinActivate($hWnd)

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

;Feature list 
#CS
		Done - Add a traytip with some message
		Done - tomighty gets restarted all of a sudden
		Done - Message tomighty is minimized fix it
		Done - Use Machine language to talkback after each routine
		Done - use sound after each routines - _SoundPlay ( $aSnd_id [, $iWait = 0] )
		Done - Minimize all the windows after 3 minutes of unattended PC
		Done - Run food porn during the lunch time
		Done - Pause speech when toggle to paused
		Done - Check if tomighty has been in used or not for more then 1 hour
		Done - Show the GTD screen at the start of the program - Cruise control image added
		Done - Add subliminal quote and messages - Screensaver added
		Done - Remove Pomodor warning message starting of pomodoro as I am using Clockwork app on mobile

		Planned - Make Tooptip, slide to apper and disapper after every 15 min
		Planned - Automatically start google sync, when it gets closed
		Planned - Have tooltip for cursor and with something quotes, time etc.
		Planned - Capture how long the working day is after starting PC and shift the routine as per that
		Planned - Add the records of PC start and stop in CSV file
		Planned - Open Aut2exe_x64.exe and Autoit help file when myprogram is opened for editing
		Planned - open the password sheet when the bill excel sheet is opened
		Broken - Add code to start and stop the system tray programs in background
		Planned - Add code to close belvedere when USB is added to laptop
		Planned - Add tabbles and tags to the new files and folders
		Planned - Activate programs which are not started in the windows start-up
		Planned - Add today is Monday along with good morning message
		Planned - Get tasks from Google task Next action and toodledo star item displayed in message
		Planned - Get google calender items displayed in message
		Planned - Upload the file on the GitHub, Find out how to sync the file on Git hub
		Broken - Toggle (with apostrophy key) fails notification message comes back after sometime.
		Broken - Run housekeeping activity when the PC is idea for more then 10 minutes 
			Delete duplicate files 
			Delete duplicate files 
				Music 
			Delete empty folders
			Run anti-virus
			Run defragging
		Planned - Get the routine list displayed in between and in ideal time
		Planned - activate kukuclock past 11 
		Planned - if chrome is not present and computer is idel run torrent at night
		Planned - Delay the routine - say using slide etc. in case if delay is happening
		Planned - Lower volume to 20% if at the playce, zero if at Welingkar
		Planned - if myprogram is already running, close the old and start the new one
		Planned - Check the background app and run those which are not running
		Broken - Fix the apostrophe hotkey for toggle on and off. 
		Broken - Unknown function name

		Planned - Check for gmail and facebook usage over chrome if more then once. 
		Planned - Use auto pause when the mails goes down to zero.
		Planned - Check if toodledo was processed or not everyday
		Planned - Check if timesnapper is started or not
		Planned - Check if any item on tooledo was completed or not.
		Planned - Check if 4Ttray minimizer window is activated by ProLasso if yes minimize it
		Planned - Check it 7+taskbar Tweaker minimizer window is activated by ProLasso if yes minimize it
		Planned - Check if windows folders are opened during startups if yes close them.
		Planned - Check Sheet 1 and Sheet 2 in Excel sheet and delete it.
		Planned - Move drag the message title up or down
		Planned - Get the bearkey disabled for accidental left panel open
		Planned - Show message of Daily Standup meeting at 10:30AM
		Planned - Show message of meeting for weekly review
		Planned - Show messages for the events and appointments from google calender
		Planned - Start timesnapper automatically at about 11:40 PM every day
		Planned - Activate IP messanger only at V2STech office
		Planned - Message Check if your phone is charged
		Planned - Close all the system running process before shuting down the laptop
		Planned - Close all the aystem running process during long ideal time and start them again after resuming
		Broken 	- Variable used without being declared
		Planned - Use routine in hard code array in variable, use GUI List control too identify where you are and denote how early or late you are
		Planned - Use TTS to get my own quote written down and spoken from time to time if possible randonmly
		Planned - Use play sound files with random self message for yourself every 15min
		Planned - use play sound for take a pomodoro break after exact 25 and 55 minute and get back to work after every 1 and 36 minute
		Planned - Have a line of Committed and non committed time
		Planned - Add a micro meditation before starting any task or activity, what does, process looks like. How many pomodoro is needed
		Planned - Make splash text window a transparent background
		Planned - Check all the shortcuts on the berokyo
		Planned - Run quotes on syste tray
		Planned - Close myprogram and tomighty, when running VLC player
		Planned - if the files on desktop is more than 300MB - Move it to Desktop file
		Planned - if the file on desktop is docx but not dollar then ask to move it to google docs
		Planned - Check integrity of files on Berkyo, if not restore it
		Planned - Whie shutdown, ensure berekyo is closed properly
#CE