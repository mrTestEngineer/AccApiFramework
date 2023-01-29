package features.helpers.mock;


import com.github.tomakehurst.wiremock.WireMockServer;
import com.github.tomakehurst.wiremock.junit.WireMockRule;

import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.options;
import static com.github.tomakehurst.wiremock.core.WireMockConfiguration.wireMockConfig;

public class MockServiceSetup {

    private static final String path = "features/helpers/mock";
    private static final WireMockServer wireMockServer = new WireMockServer(options().port(8089).usingFilesUnderClasspath(path)); //No-args constructor will start on port 8080, no HTTPS

    private MockServiceSetup() {
    }

    //Get the only object available
    public static WireMockServer getWireMockServer() {
        return wireMockServer;
    }


    public static void startMockServer() {
        wireMockServer.start();
        System.out.println("MOCK BASE URL:: " + wireMockServer.baseUrl());

    }

    public static void stopMockServer() {
        wireMockServer.stop();


    }


}
