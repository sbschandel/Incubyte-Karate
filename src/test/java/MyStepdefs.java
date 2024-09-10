public class MyStepdefs {
    @io.cucumber.java.en.Given("^url 'https://gmail\\.googleapis\\.com/gmail/v(\\d+)/users/me/messages/send'$")
    public void urlHttpsGmailGoogleapisComGmailVUsersMeMessagesSend(int arg0) {
    }

    @io.cucumber.java.en.And("^headers { Authorization: 'Bearer <your-access-token>' }$")
    public void headersAuthorizationBearerYourAccessToken() {
    }

    @io.cucumber.java.en.And("^request {$")
    public void request() {
    }

    @io.cucumber.java.en.When("^method post$")
    public void methodPost() {
    }

    @io.cucumber.java.en.Then("^status (\\d+)$")
    public void status(int arg0) {
    }

    @io.cucumber.java.en.And("^match response == { id: '#string', labelIds: '#array' }$")
    public void matchResponseIdStringLabelIdsArray() {
    }
}
