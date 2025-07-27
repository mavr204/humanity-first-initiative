package UserLogin;

import java.util.Date;

public class Payment {
    private String transactionId;
    private String name;
    private Date paymentDate;
    private String amount;
    private String cardNumber;
    private String email;

    // Constructors, getters, and setters

    public Payment(String transactionId, String name, Date paymentDate, String amount, String cardNumber, String email) {
        this.transactionId = transactionId;
        this.name = name;
        this.paymentDate = paymentDate;
        this.amount = amount;
        this.cardNumber = cardNumber;
        this.email = email;
    }

    // Getters and setters for each attribute

    public String getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
