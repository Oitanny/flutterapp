<?php
function sendFCM(){
    $url="https://fcm.googleapis.com/fcm/send";

    //Server key of Cloud Messaging
    $apiKey="AAAAOKsTDcM:APA91bEi1FUSIHNdtcec9-rDT4fpJ3MmwFrlc6-06bWZFPCTkaP7ca5-0hpgMpMf45LTe1UmhQCyg9BHV-QhlB2A0vQHJV3EYA_rfvq0V3hURwnEGBzbjbauYTQKHJp2Nq07BVSZjlh3";
    $headers=array(
    'Authorization:key='.$apiKey;
    'Content-Type:application/json'
    );

    //The things we need to send to Firebase server
    $notifData=[
        'title'=>'My New Notification',
        'body'=>'My Notification body',
        //'image'=>
        //'click_action'=''
    ];
    //optional
    $dataPayload=[
        'to'=> 'VIP',
        'data'=>'2023-02-12',
        'other_data'=>'Data HI!!'
    ];

    //Create API Body
    $notifBody=[
        'notification'=>$notifData,
        //optional
        'data'=>$dataPayload,
        'time_to_live'=> 3600 //in seconds , max_time is 4 weeks, this is optional
        //'registration_ids'=>
    ];

    $ch=curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_POST,true);
    curl_setopt($ch,CURLOPT_HTTPHEADER,$headers);
}
?>