
package src;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class writeRegistration implements Serializable {

    public boolean Write(String UUID_registration, Registration_file regFile) {

        try {
            FileOutputStream fileOut = 
                    new FileOutputStream(UUID_registration); // UUID is the name
            ObjectOutputStream out = new ObjectOutputStream(fileOut);
            out.writeObject(regFile);
            out.flush();
            out.close();
            
            System.out.println("written the  registration file: " + UUID_registration);
            System.out.println("");
            return true;
        } catch (IOException ex) {
            ex.printStackTrace();
            System.out.println("Error writing registration file: " + UUID_registration);
            return false;
        }
    }

}
