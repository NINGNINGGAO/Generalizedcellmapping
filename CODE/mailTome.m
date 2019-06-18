function mailTome(varargin)
%--------------------------------------------------------------------------
%Send the results to your mailbox
% 
%input argument
%           MailAddress
%           password:Open SMTP service,Client Authorization Password
%                           Non-login password
%           DataPath:Path of picture
%
%author:NINGNINGGAO
%--------------------------------------------------------------------------

MailAddress=varargin{1};
password=varargin{2};
subject = 'The code has runs out!';
content = 'The code has runs out!';
MailServer='smtp.qq.com';
if nargin < 2 && nargin > 3
    error('input error')
end
setpref('Internet','E_mail',MailAddress);
setpref('Internet','SMTP_Server',MailServer);
setpref('Internet','SMTP_Username',MailAddress);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
if nargin==2
    sendmail(MailAddress,subject,content);
end
if nargin==3
    DataPath=varargin{3};
    sendmail(MailAddress,subject,content,DataPath);
end
end