package src;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Administrator
 */
public class DeptEmailList {

//    private static String BanquetEmail = "Rahul.P.Bakker@ritzcarlton.com";
//    private static String CCSEmail = "Robert.Zellner@ritzcarlton.com";
//    private static String CoopSalesEmail = "Pavlina.Tarabova@ritzcarlton.com";
//    private static String EngineeringEmail = "Mohamed.Khan@ritzcarlton.com";
//    private static String financeEmail = "finance@ritzcarlton.com";
//    private static String FnBEmail = "Romain.Mejecaze@ritzcarlton.com";
//    private static String govtSalesEmail = "mohamed.mustafa@ritzcarlton.com";
//    private static String grpSalesEmail = "grpsales@ritzcarlton.com";
//    private static String houseKeepingEmail = "housekeeping@ritzcarlton.com";
//    private static String HREmail = "Tintin.Mya@ritzcarlton.com";
//    private static String LPEmail = "Adnan.Alabbadi@marriott.com";
//    private static String purchasingEmail = "purchasing@ritzcarlton.com";
//    private static String QualityEmail = "Madhubi.Wilmotte@ritzcarlton.com";
//    private static String revenueMgmtEmail = "Ryan.Dsouza@ritzcarlton.com";
//    private static String roomsEmail = "wayan.raksa@ritzcarlton.com";
//    private static String salesMarketingEmail = "susanne.stier@ritzcarlton.com";
//    private static String salesEmail = "Arnaud.Giacometti@ritzcarlton.com";
////    private static String spaEmail = "kalpaw@yahoo.com";
//    private static String spaEmail = "slishan@gmail.com";
//    private static String systemsEmail = "ligesh.gopi@ritzcarlton.com";
//    private static String travelIndustrySalesEmail = "Maria.Kotybaeva@ritzcarlton.com";

    public String getDB_dir_Email(final String DeptName) {
        String demail = null;
        try {
            PreparedStatement ps = jdbc.getConnection().prepareStatement("select diremail from dept where dept=?");
            ps.setString(1, DeptName);
//            Statement st = jdbc.getConnection().createStatement();
            ResultSet rs = ps.executeQuery();
            if (rs.first()) {
//                ResultSet rs2 = st.executeQuery("select dept from dept where deptid=" + rs.getString("dept_deptid"));
//                rs2.first();
                demail = rs.getString("diremail");
//                rs2.close();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return demail;
    }
    public String getDB_Div_Email(final String DeptName) {
        String demail = null;
        try {
            PreparedStatement ps = jdbc.getConnection().prepareStatement("select divemail from dept where dept=?");
            ps.setString(1, DeptName);
//            Statement st = jdbc.getConnection().createStatement();
            ResultSet rs = ps.executeQuery();
            if (rs.first()) {
//                ResultSet rs2 = st.executeQuery("select dept from dept where deptid=" + rs.getString("dept_deptid"));
//                rs2.first();
                demail = rs.getString("divemail");
//                rs2.close();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return demail;
    }

    public String getDB_DeptHeadName(final String deptName) {
        String headName = null;
        try {
            PreparedStatement ps = jdbc.getConnection().prepareStatement("select dirname from dept where dept=?");
            ps.setString(1, deptName);
//            Statement st = jdbc.getConnection().createStatement();
            ResultSet rs = ps.executeQuery();
            if (rs.first()) {
//                ResultSet rs2 = st.executeQuery("select dept from dept where deptid=" + rs.getString("dept_deptid"));
//                rs2.first();
                headName = rs.getString("dirname");
//                rs2.close();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return headName;
    }
    public String getDB_DivHeadName(final String deptName) {
        String headName = null;
        try {
            PreparedStatement ps = jdbc.getConnection().prepareStatement("select divname from dept where dept=?");
            ps.setString(1, deptName);
//            Statement st = jdbc.getConnection().createStatement();
            ResultSet rs = ps.executeQuery();
            if (rs.first()) {
//                ResultSet rs2 = st.executeQuery("select dept from dept where deptid=" + rs.getString("dept_deptid"));
//                rs2.first();
                headName = rs.getString("divname");
//                rs2.close();
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return headName;
    }

    public void serializeEmails() {

    }

    public void DeSerializeEmails() {

    }

    /**
     * @return the BanquetEmail
     */
//    public static String getBanquetEmail() {
//        return BanquetEmail;
//    }
//
//    /**
//     * @param aBanquetEmail the BanquetEmail to set
//     */
//    public static void setBanquetEmail(String aBanquetEmail) {
//        BanquetEmail = aBanquetEmail;
//    }
//
//    /**
//     * @return the CCSEmail
//     */
//    public static String getCCSEmail() {
//        return CCSEmail;
//    }
//
//    /**
//     * @param aCCSEmail the CCSEmail to set
//     */
//    public static void setCCSEmail(String aCCSEmail) {
//        CCSEmail = aCCSEmail;
//    }
//
//    /**
//     * @return the CoopSalesEmail
//     */
//    public static String getCoopSalesEmail() {
//        return CoopSalesEmail;
//    }
//
//    /**
//     * @param aCoopSalesEmail the CoopSalesEmail to set
//     */
//    public static void setCoopSalesEmail(String aCoopSalesEmail) {
//        CoopSalesEmail = aCoopSalesEmail;
//    }
//
//    /**
//     * @return the EngineeringEmail
//     */
//    public static String getEngineeringEmail() {
//        return EngineeringEmail;
//    }
//
//    /**
//     * @param aEngineeringEmail the EngineeringEmail to set
//     */
//    public static void setEngineeringEmail(String aEngineeringEmail) {
//        EngineeringEmail = aEngineeringEmail;
//    }
//
//    /**
//     * @return the financeEmail
//     */
//    public static String getFinanceEmail() {
//        return financeEmail;
//    }
//
//    /**
//     * @param aFinanceEmail the financeEmail to set
//     */
//    public static void setFinanceEmail(String aFinanceEmail) {
//        financeEmail = aFinanceEmail;
//    }
//
//    /**
//     * @return the FnBEmail
//     */
//    public static String getFnBEmail() {
//        return FnBEmail;
//    }
//
//    /**
//     * @param aFnBEmail the FnBEmail to set
//     */
//    public static void setFnBEmail(String aFnBEmail) {
//        FnBEmail = aFnBEmail;
//    }
//
//    /**
//     * @return the govtSalesEmail
//     */
//    public static String getGovtSalesEmail() {
//        return govtSalesEmail;
//    }
//
//    /**
//     * @param aGovtSalesEmail the govtSalesEmail to set
//     */
//    public static void setGovtSalesEmail(String aGovtSalesEmail) {
//        govtSalesEmail = aGovtSalesEmail;
//    }
//
//    /**
//     * @return the grpSalesEmail
//     */
//    public static String getGrpSalesEmail() {
//        return grpSalesEmail;
//    }
//
//    /**
//     * @param aGrpSalesEmail the grpSalesEmail to set
//     */
//    public static void setGrpSalesEmail(String aGrpSalesEmail) {
//        grpSalesEmail = aGrpSalesEmail;
//    }
//
//    /**
//     * @return the houseKeepingEmail
//     */
//    public static String getHouseKeepingEmail() {
//        return houseKeepingEmail;
//    }
//
//    /**
//     * @param aHouseKeepingEmail the houseKeepingEmail to set
//     */
//    public static void setHouseKeepingEmail(String aHouseKeepingEmail) {
//        houseKeepingEmail = aHouseKeepingEmail;
//    }
//
//    /**
//     * @return the HREmail
//     */
//    public static String getHREmail() {
//        return HREmail;
//    }
//
//    /**
//     * @param aHREmail the HREmail to set
//     */
//    public static void setHREmail(String aHREmail) {
//        HREmail = aHREmail;
//    }
//
//    /**
//     * @return the LPEmail
//     */
//    public static String getLPEmail() {
//        return LPEmail;
//    }
//
//    /**
//     * @param aLPEmail the LPEmail to set
//     */
//    public static void setLPEmail(String aLPEmail) {
//        LPEmail = aLPEmail;
//    }
//
//    /**
//     * @return the purchasingEmail
//     */
//    public static String getPurchasingEmail() {
//        return purchasingEmail;
//    }
//
//    /**
//     * @param aPurchasingEmail the purchasingEmail to set
//     */
//    public static void setPurchasingEmail(String aPurchasingEmail) {
//        purchasingEmail = aPurchasingEmail;
//    }
//
//    /**
//     * @return the QualityEmail
//     */
//    public static String getQualityEmail() {
//        return QualityEmail;
//    }
//
//    /**
//     * @param aQualityEmail the QualityEmail to set
//     */
//    public static void setQualityEmail(String aQualityEmail) {
//        QualityEmail = aQualityEmail;
//    }
//
//    /**
//     * @return the revenueMgmtEmail
//     */
//    public static String getRevenueMgmtEmail() {
//        return revenueMgmtEmail;
//    }
//
//    /**
//     * @param aRevenueMgmtEmail the revenueMgmtEmail to set
//     */
//    public static void setRevenueMgmtEmail(String aRevenueMgmtEmail) {
//        revenueMgmtEmail = aRevenueMgmtEmail;
//    }
//
//    /**
//     * @return the roomsEmail
//     */
//    public static String getRoomsEmail() {
//        return roomsEmail;
//    }
//
//    /**
//     * @param aRoomsEmail the roomsEmail to set
//     */
//    public static void setRoomsEmail(String aRoomsEmail) {
//        roomsEmail = aRoomsEmail;
//    }
//
//    /**
//     * @return the salesMarketingEmail
//     */
//    public static String getSalesMarketingEmail() {
//        return salesMarketingEmail;
//    }
//
//    /**
//     * @param aSalesMarktingEmail the salesMarketingEmail to set
//     */
//    public static void setSalesMarketingEmail(String aSalesMarktingEmail) {
//        salesMarketingEmail = aSalesMarktingEmail;
//    }
//
//    /**
//     * @return the salesEmail
//     */
//    public static String getSalesEmail() {
//        return salesEmail;
//    }
//
//    /**
//     * @param aSalesEmail the salesEmail to set
//     */
//    public static void setSalesEmail(String aSalesEmail) {
//        salesEmail = aSalesEmail;
//    }
//
//    /**
//     * @return the spaEmail
//     */
//    public static String getSpaEmail() {
//        return spaEmail;
//    }
//
//    /**
//     * @param aSpaEmail the spaEmail to set
//     */
//    public static void setSpaEmail(String aSpaEmail) {
//        spaEmail = aSpaEmail;
//    }
//
//    /**
//     * @return the systemsEmail
//     */
//    public static String getSystemsEmail() {
//        return systemsEmail;
//    }
//
//    /**
//     * @param aSystemsEmail the systemsEmail to set
//     */
//    public static void setSystemsEmail(String aSystemsEmail) {
//        systemsEmail = aSystemsEmail;
//    }
//
//    /**
//     * @return the travelIndustrySalesEmail
//     */
//    public static String getTravelIndustrySalesEmail() {
//        return travelIndustrySalesEmail;
//    }
//
//    /**
//     * @param aTravelIndustrySalesEmail the travelIndustrySalesEmail to set
//     */
//    public static void setTravelIndustrySalesEmail(String aTravelIndustrySalesEmail) {
//        travelIndustrySalesEmail = aTravelIndustrySalesEmail;
//    }
}
