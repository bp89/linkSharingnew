<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
<table width="641" border="0" align="center" cellpadding="0" cellspacing="0">
    <style type="text/css">
    body,td,th {
        color: #373737;
        font-family: Tahoma, Verdana,sans-serif, Arial, Helvetica;
    }
    body {
        background-color: #ff9e8f;
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
    .tit {
        font-size:14px;
        color: #4761ff;
        font-weight: bold;

    }
    .writename {
        font-size:12px;
        color:#000000;
        padding-left:180px;

    }
    .titbless {
        font-size:18px;
        color:#000000;
    }
    .textpadding {
        padding:0px 14px;
    }
    .content {
        font-size:12px;
        line-height:14px;
        color:#000000;
        letter-spacing:0.6px;
    }
    .footertext {
        font-size:12px;
        color:#646363;
    }
    .contenttit {
        font-size:12px;
        letter-spacing:1px;
    }
    .cards01border {
        background-image: url(http://reasonablespread.com/spreadresource/template/email/47/images/CardsCelebration_01.jpg);
        background-repeat: no-repeat;
        background-position: right bottom;
        border: 1px solid #CCCCCC;
    }
    a:link {
        color: #707070;
        text-decoration: underline;
    }
    a:visited {
        color: #707070;
        text-decoration: underline;
    }
    a:hover {
        color: #707070;
        text-decoration: none;
    }
    a:active {
        color: #707070;
        text-decoration: underline;
    }
    </style>
    <tr>
        <td height="30" align="left" >&nbsp;</td>
    </tr>
    <tr>
        <td height="355" align="left" valign="top" class="cards01border"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="tit">Dear ${user?.firstName} ${user?.lastName}</td>
            </tr>
            <tr>
                <td height="27" colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="titbless">You are invited to join topic ${topic.name} .</td>
            </tr>
            <tr>
                <td colspan="2" class="titbless">&nbsp;</td>
            </tr>
            <tr>
                <td width="50%" height="108" class="content">
                    You may join topic by logging into your account and accepting the invitation or click link below to accept invitation.

                    <a href="#">Join Topic</a>
                </td>
                <td width="50%" class="content">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" class="content">&nbsp;</td>
            </tr>
            <tr>
                <td><span class="writename">Sincerely,</span><br>
                    <span class="writename">- ${sender?.firstName} ${sender?.lastName}</span></td>
                <td class="content">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
</table>
</body>
</html>
