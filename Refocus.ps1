$terminate = @() #array for all the potential programs to terminate
$focus = @() #array for refocus
$test = ""
while(($test -ine "q") -and ($test -ine "quit"))
{
    $terminate += read-host -prompt "Enter a process name to terminate"
    $focus += read-host -prompt "Enter a website or full path to a process to refocus on"
    $test = read-host -prompt "Enter Q to quit adding programs"
}
while((get-date -format HH) -gt 1 )
{
for($i=0; $i -lt $terminate.Length; $i++)
{
    $process = get-process -processname $terminate[$i] -ErrorAction SilentlyContinue #catch the errors if the process isn't running
    if ($process -ne $null)
    {
        stop-process -name $terminate[$i]
        start-process $focus[$i] 
    }
}
}
