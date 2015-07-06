package src;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class Registration_file implements Serializable {

    private String UUID_registration;
    private String Department;
    private String Designation;
    private String EmployeeID;
    private String FirstName;
    private String LastName;
    private String RequestDate;
    private String EnterpriseID;
    private String DateJoined;
    private String ManagerName;
    private String ManagerTitle;
    private String ManagerSignature;
    private String ManagerTimestamp;
    private String EmailDisplayName;
    private String EmailAddress;
    
    
    private String User1Email;
    private String User2Email;
    private String User3Email; //user 3 should be Finance Dir
    private String User4Email; // user 4 will be the last one to see everything and its the IT dept....
    private String[] RequestedAccessArray;
    private boolean User1OK;
    private boolean User2OK;
    private boolean User3OK;
    private String User1OKTimestamp;
    private String User2OKTimestamp;
    private String User3OKTimestamp;

    /**
     * @return the UUID_registration
     */
    public String getUUID_registration() {
        return UUID_registration;
    }

    /**
     * @param UUID_registration the UUID_registration to set
     */
    public void setUUID_registration(String UUID_registration) {
        this.UUID_registration = UUID_registration;
    }

    /**
     * @return the Department
     */
    public String getDepartment() {
        return Department;
    }

    /**
     * @param Department the Department to set
     */
    public void setDepartment(String Department) {
        this.Department = Department;
    }

    /**
     * @return the Designation
     */
    public String getDesignation() {
        return Designation;
    }

    /**
     * @param Designation the Designation to set
     */
    public void setDesignation(String Designation) {
        this.Designation = Designation;
    }

    /**
     * @return the EmployeeID
     */
    public String getEmployeeID() {
        return EmployeeID;
    }

    /**
     * @param EmployeeID the EmployeeID to set
     */
    public void setEmployeeID(String EmployeeID) {
        this.EmployeeID = EmployeeID;
    }

    /**
     * @return the FirstName
     */
    public String getFirstName() {
        return FirstName;
    }

    /**
     * @param FirstName the FirstName to set
     */
    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    /**
     * @return the LastName
     */
    public String getLastName() {
        return LastName;
    }

    /**
     * @param LastName the LastName to set
     */
    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    /**
     * @return the EmailDisplayName
     */
    public String getEmailDisplayName() {
        return EmailDisplayName;
    }

    /**
     * @param EmailDisplayName the EmailDisplayName to set
     */
    public void setEmailDisplayName(String EmailDisplayName) {
        this.EmailDisplayName = EmailDisplayName;
    }

    /**
     * @return the RequestedAccessArray
     */
    public String[] getRequestedAccessArray() {
        return RequestedAccessArray;
    }

    /**
     * @param RequestedAccessArray the RequestedAccessArray to set
     */
    public void setRequestedAccessArray(String[] RequestedAccessArray) {
        this.RequestedAccessArray = RequestedAccessArray;
    }

    /**
     * @return the User1Email
     */
    public String getUser1Email() {
        return User1Email;
    }

    /**
     * @param User1Email the User1Email to set
     */
    public void setUser1Email(String User1Email) {
        this.User1Email = User1Email;
    }

    /**
     * @return the User2Email
     */
    public String getUser2Email() {
        return User2Email;
    }

    /**
     * @param User2Email the User2Email to set
     */
    public void setUser2Email(String User2Email) {
        this.User2Email = User2Email;
    }

    /**
     * @return the User3Email
     */
    public String getUser3Email() {
        return User3Email;
    }

    /**
     * @param User3Email the User3Email to set
     */
    public void setUser3Email(String User3Email) {
        this.User3Email = User3Email;
    }

    /**
     * @return the User4Email
     */
    public String getUser4Email() {
        return User4Email;
    }

    /**
     * @param User4Email the User4Email to set
     */
    public void setUser4Email(String User4Email) {
        this.User4Email = User4Email;
    }

    /**
     * @return the User1OK
     */
    public boolean isUser1OK() {
        return User1OK;
    }

    /**
     * @param User1OK the User1OK to set
     */
    public void setUser1OK(boolean User1OK) {
        this.User1OK = User1OK;
    }

    /**
     * @return the User2OK
     */
    public boolean isUser2OK() {
        return User2OK;
    }

    /**
     * @param User2OK the User2OK to set
     */
    public void setUser2OK(boolean User2OK) {
        this.User2OK = User2OK;
    }

    /**
     * @return the User3OK
     */
    public boolean isUser3OK() {
        return User3OK;
    }

    /**
     * @param User3OK the User3OK to set
     */
    public void setUser3OK(boolean User3OK) {
        this.User3OK = User3OK;
    }

    /**
     * @return the RequestDate
     */
    public String getRequestDate() {
        return RequestDate;
    }

    /**
     * @param RequestDate the RequestDate to set
     */
    public void setRequestDate(String RequestDate) {
        this.RequestDate = RequestDate;
    }

    /**
     * @return the EnterpriseID
     */
    public String getEnterpriseID() {
        return EnterpriseID;
    }

    /**
     * @param EnterpriseID the EnterpriseID to set
     */
    public void setEnterpriseID(String EnterpriseID) {
        this.EnterpriseID = EnterpriseID;
    }

    /**
     * @return the DateJoined
     */
    public String getDateJoined() {
        return DateJoined;
    }

    /**
     * @param DateJoined the DateJoined to set
     */
    public void setDateJoined(String DateJoined) {
        this.DateJoined = DateJoined;
    }

    /**
     * @return the ManagerName
     */
    public String getManagerName() {
        return ManagerName;
    }

    /**
     * @param ManagerName the ManagerName to set
     */
    public void setManagerName(String ManagerName) {
        this.ManagerName = ManagerName;
    }

    /**
     * @return the ManagerTitle
     */
    public String getManagerTitle() {
        return ManagerTitle;
    }

    /**
     * @param ManagerTitle the ManagerTitle to set
     */
    public void setManagerTitle(String ManagerTitle) {
        this.ManagerTitle = ManagerTitle;
    }

    /**
     * @return the ManagerSignature
     */
    public String getManagerSignature() {
        return ManagerSignature;
    }

    /**
     * @param ManagerSignature the ManagerSignature to set
     */
    public void setManagerSignature(String ManagerSignature) {
        this.ManagerSignature = ManagerSignature;
    }

    /**
     * @return the EmailAddress
     */
    public String getEmailAddress() {
        return EmailAddress;
    }

    /**
     * @param EmailAddress the EmailAddress to set
     */
    public void setEmailAddress(String EmailAddress) {
        this.EmailAddress = EmailAddress;
    }

    /**
     * @return the User1OKTimestamp
     */
    public String getUser1OKTimestamp() {
        return User1OKTimestamp;
    }

    /**
     * @param User1OKTimestamp the User1OKTimestamp to set
     */
    public void setUser1OKTimestamp(String User1OKTimestamp) {
        this.User1OKTimestamp = User1OKTimestamp;
    }

    /**
     * @return the User2OKTimestamp
     */
    public String getUser2OKTimestamp() {
        return User2OKTimestamp;
    }

    /**
     * @param User2OKTimestamp the User2OKTimestamp to set
     */
    public void setUser2OKTimestamp(String User2OKTimestamp) {
        this.User2OKTimestamp = User2OKTimestamp;
    }

    /**
     * @return the User3OKTimestamp
     */
    public String getUser3OKTimestamp() {
        return User3OKTimestamp;
    }

    /**
     * @param User3OKTimestamp the User3OKTimestamp to set
     */
    public void setUser3OKTimestamp(String User3OKTimestamp) {
        this.User3OKTimestamp = User3OKTimestamp;
    }

    /**
     * @return the ManagerTimestamp
     */
    public String getManagerTimestamp() {
        return ManagerTimestamp;
    }

    /**
     * @param ManagerTimestamp the ManagerTimestamp to set
     */
    public void setManagerTimestamp(String ManagerTimestamp) {
        this.ManagerTimestamp = ManagerTimestamp;
    }
}
