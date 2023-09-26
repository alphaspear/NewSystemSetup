# NewSystemSetup
bash scripts containing the code for auto install of basic apps i require

```
sudo apt install git -y
git clone https://github.com/alphaspear/NewSystemSetup.git
cd NewSystemSetup
chmod +x *.sh
/bin/bash main.sh
```



import os
from ftplib import FTP

class FileDownloader:
    def __init__(self, sftp_host, sftp_user, sftp_password, local_folder):
        self.sftp_host = sftp_host
        self.sftp_user = sftp_user
        self.sftp_password = sftp_password
        self.local_folder = local_folder

        # Ensure the local folder exists, create it if it doesn't
        if not os.path.exists(self.local_folder):
            os.makedirs(self.local_folder)

    def download_files(self, file_list):
        try:
            with FTP(self.sftp_host) as ftp:
                ftp.login(self.sftp_user, self.sftp_password)
                ftp.cwd('/')
                
                for file_name in file_list:
                    remote_path = '/' + file_name
                    local_path = os.path.join(self.local_folder, file_name)
                    
                    with open(local_path, 'wb') as local_file:
                        ftp.retrbinary('RETR ' + remote_path, local_file.write)
                    
                    print(f"Downloaded: {file_name}")
        
        except Exception as e:
            print(f"Error: {e}")

# Usage example:
if __name__ == "__main__":
    sftp_host = "your_sftp_server.com"
    sftp_user = "your_sftp_username"
    sftp_password = "your_sftp_password"
    local_folder = "local_directory_path"
    file_list = ["file1.txt", "file2.txt"]  # List of files to download
    
    downloader = FileDownloader(sftp_host, sftp_user, sftp_password, local_folder)
    downloader.download_files(file_list)

