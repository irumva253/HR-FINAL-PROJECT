import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;

import com.mysql.cj.jdbc.Blob;

public class EmployeePHOTO {
Blob blob = resultSet.getBlob("image");
    
    InputStream inputStream = blob.getBinaryStream();
    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
    byte[] buffer = new byte[4096];
    int bytesRead = -1;
     
    while ((bytesRead = inputStream.read(buffer)) != -1) {
        outputStream.write(buffer, 0, bytesRead);                  
    }
     
    byte[] imageBytes = outputStream.toByteArray();
    String base64Image = Base64.getEncoder().encodeToString(imageBytes);
     
     
    inputStream.close();
    outputStream.close();
}
