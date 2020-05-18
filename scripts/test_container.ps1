$count=0
do {
  $count++
  Write-Output "[$env:STAGE_NAME] Start Container [Attempt: $count]"
  $testStart = Invoke-WebRequest -Uri http://localhost:8080

  if($testStart.statuscode -eq '200'){
    $started = true
  } else{
    Start-sleep -seconds 1
  }

} until ($started -or ($count -eq 3))

if(!$started) {
  exit 1
}
