/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package src;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class readRegistration implements Serializable {

    public static Registration_file Read(String UUID_registration) {
        Registration_file regFile = null;
        try {
            System.out.println("############# TRYING TO READ FILE ################");
            FileInputStream fileIn = new FileInputStream(UUID_registration); // read the file with this UUID
            ObjectInputStream in = new ObjectInputStream(fileIn);
            regFile = (Registration_file) in.readObject();

            return regFile;
        } catch (IOException ex) {
            System.out.println(ex);
            System.out.println("--------error reading file with: " + UUID_registration);
            System.out.println("--------IO ERROR-------- ");
            System.out.println("--------possibly, the file is missing-------- ");
            return null;
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
