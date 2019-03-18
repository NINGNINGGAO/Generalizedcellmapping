function mailTome(varargin)
MailAddress=varargin{1};
password=varargin{2};
subject=varargin{3};
content=varargin{4};
MailServer=varargin{5};
if nargin<5 && nargin>6
    error('To much input')
end
setpref('Internet','E_mail',MailAddress);
setpref('Internet','SMTP_Server',MailServer);%’‚¿Ô «smtp.qq.com
setpref('Internet','SMTP_Username',MailAddress);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
if nargin==5
    sendmail(MailAddress,subject,content);
end
if nargin==6
    DataPath=varargin{6};
    sendmail(MailAddress,subject,content,DataPath);
end
end