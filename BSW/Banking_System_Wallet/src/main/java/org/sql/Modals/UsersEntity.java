package org.sql.Modals;

import javax.persistence.*;

@Entity
@Table(name = "users", schema = "banking_system_wallet", catalog = "")
public class UsersEntity {
    private int userId;
    private String userName;
    private String userEmail;
    private String userNationalId;
    private String userContact;
    private String userPassword;
    private String userAddress;

    @Id
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "user_name", nullable = false, length = 255)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Basic
    @Column(name = "user_email", nullable = false, length = 255)
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Basic
    @Column(name = "user_national_id", nullable = false, length = 255)
    public String getUserNationalId() {
        return userNationalId;
    }

    public void setUserNationalId(String userNationalId) {
        this.userNationalId = userNationalId;
    }

    @Basic
    @Column(name = "user_contact", nullable = false, length = 255)
    public String getUserContact() {
        return userContact;
    }

    public void setUserContact(String userContact) {
        this.userContact = userContact;
    }

    @Basic
    @Column(name = "user_password", nullable = false, length = 255)
    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    @Basic
    @Column(name = "user_address", nullable = false, length = 600)
    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersEntity that = (UsersEntity) o;

        if (userId != that.userId) return false;
        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
        if (userEmail != null ? !userEmail.equals(that.userEmail) : that.userEmail != null) return false;
        if (userNationalId != null ? !userNationalId.equals(that.userNationalId) : that.userNationalId != null)
            return false;
        if (userContact != null ? !userContact.equals(that.userContact) : that.userContact != null) return false;
        if (userPassword != null ? !userPassword.equals(that.userPassword) : that.userPassword != null) return false;
        if (userAddress != null ? !userAddress.equals(that.userAddress) : that.userAddress != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userEmail != null ? userEmail.hashCode() : 0);
        result = 31 * result + (userNationalId != null ? userNationalId.hashCode() : 0);
        result = 31 * result + (userContact != null ? userContact.hashCode() : 0);
        result = 31 * result + (userPassword != null ? userPassword.hashCode() : 0);
        result = 31 * result + (userAddress != null ? userAddress.hashCode() : 0);
        return result;
    }
}
