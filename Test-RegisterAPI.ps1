function Test-RegisterAPI 
{
    param(
        $InputObject
    )

    # Need to capture error when given not same password
    # Error is being caught, need to store in variable and return.

    $uri = 'http://localhost:8000/api/register'

    $returnObject = @()

    try 
    {
        $data = Invoke-WebRequest -Uri $uri -Method Post -ContentType 'application/json' -Body $InputObject
        return $data
    }
    catch
    {
        return $data
    }
    
}

$jsonObject = [ordered]@{
    first_name = 'Carl'
    last_name = 'Castillo'
    email = 'carlcastillo@me.com'
    password = '123'
    password_confirm = '1234'
} | ConvertTo-Json
Test-RegisterAPI -InputObject $jsonObject
