!include StrContains.nsh

!macro customHeader
  Var sparkleServiceWasRunning
!macroend

!macro StopSparkleServiceIfRunning
  nsExec::ExecToStack '"$SYSDIR\sc.exe" query SparkleService'
  Pop $R2
  Pop $R3
  ${StrContains} $R4 "RUNNING" "$R3"

  ${If} $R4 != ""
    StrCpy $sparkleServiceWasRunning "true"
    DetailPrint "Stopping Sparkle service"
    nsExec::ExecToLog '"$SYSDIR\sc.exe" stop SparkleService'
    Sleep 3000
  ${EndIf}
!macroend

!macro customInit
  StrCpy $sparkleServiceWasRunning "false"
  !insertmacro StopSparkleServiceIfRunning
!macroend

!macro customInstall
  ${If} $sparkleServiceWasRunning == "true"
    StrCpy $R1 "$INSTDIR\resources\files\sparkle-service.exe"
    ${If} ${FileExists} "$R1"
      DetailPrint "Starting Sparkle service: $R1"
      ExecWait '"$R1" service start' $R2
      ${If} $R2 != 0
        DetailPrint "Sparkle service start exited with code $R2"
      ${EndIf}
    ${EndIf}
  ${EndIf}
!macroend
