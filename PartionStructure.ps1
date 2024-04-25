Set-ExecutionPolicy Unrestricted
$partitionSet = New-Object System.Collections.Generic.HashSet[string]

# Get information about all partitions on the specified disk
$diskNumber = 0  # Change this to the appropriate disk number
$partitions = Get-Partition -DiskNumber $diskNumber



# Loop through each partition
foreach ($partition in $partitions) {
    #$partitionNumber = $partition.PartitionNumber
    #$type = $partition.Type
    #$driveLetter=$partition.DriveLetter
    $partitionSet.Add($partition.type)  
     

}
    Write-Host 'Actual Partition--->'  $partitionSet

$ExpectedPartitionSet =New-Object System.Collections.Generic.HashSet[string]
$ExpectedPartitionSet = ('System' ,'MSR' ,'Windows' ,'Reserved')

    Write-Host 'Expected Partition--->'$ExpectedPartitionSet

if ($partitionSet -eq $ExpectedPartitionSet)
{
    Write-host 'Partirion Struture is proper'
}
else
{
 Write-host 'Partition structure is not as expected'
}




