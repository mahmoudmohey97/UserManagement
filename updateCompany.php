<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
include_once'config/database.php';
include_once 'objects/company.php';
include_once 'objects/interest.php';
include_once 'objects/companyLocation.php';
//verify that no place is empty

$database = new Database();
$db = $database->getConnection();
$company = new Company($db);
$interest = new Interest($db);
$companyLocation = new CompanyLocation($db);
$data = json_decode(file_get_contents("php://input"));

$interest->choosenInterests = $data->INTERESTS;
$companyLocation->companyLocations = $data->LOCATIONS;
$company->EMAIL = $data->EMAIL;
$company->NAME = $data->NAME;
$company->NUMEMPLOYEES = $data->NUMEMPLOYEES;


if($company->update($company->EMAIL))
{
    $id = $company->getUserId($company->EMAIL);
    if($interest->delete($id))
    {

        $interest->update($id);

        if($companyLocation->delete($id))
        {
            $companyLocation->update($id);
            http_response_code(200);
            echo json_encode(array("message"=>"update 8aleban succesfull"));
        }
        else
        {
            http_response_code(502);
            echo json_encode(array("meesage"=>"error deleting locations"));
        }
    }
    else
    {
        http_response_code(500);
        echo json_encode(array("meesage"=>"error deleting interests"));
    }
}
else
{
    http_response_code(501);
    json_encode(array("message"=>"error updatiing company properties"));
}


