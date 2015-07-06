
package src;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class readAllFiles {

//    final File folder = new File(".");
    public ArrayList listFilesForFolder(final File folder) {
        ArrayList ar = new ArrayList();
        for (final File fileEntry : folder.listFiles()) {
            if (fileEntry.isDirectory()) {
                listFilesForFolder(fileEntry);
            } else {
                if(fileEntry.getName().endsWith(".efile"))
                ar.add(fileEntry.getName().substring(0, fileEntry.getName().lastIndexOf(".")));
            }
        }
        return ar;
    }
//    public static void main(String[] args) {
//         Date date = new Date();
////        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
//        SimpleDateFormat sdf = new SimpleDateFormat("EEE, d MMM yyyy h:mm:ss a z");
////        SimpleDateFormat sdf2 = new SimpleDateFormat("EEE, d MMM yyyy h:mm:ss a Z");
//        sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
////        sdf2.setTimeZone(TimeZone.getTimeZone("GMT"));
//        String formattedDate = sdf.format(date);
//        System.out.println(formattedDate);
////        try {
////            System.out.println(sdf2.parse(formattedDate));
////        } catch (ParseException ex) {
////            Logger.getLogger(readAllFiles.class.getName()).log(Level.SEVERE, null, ex);
////        }
//    }
}
