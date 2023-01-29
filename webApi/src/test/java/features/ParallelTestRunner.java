package features;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.github.tomakehurst.wiremock.WireMockServer;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import features.helpers.mock.MockServiceSetup;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;



class ParallelTestRunner {


    static WireMockServer wireMockServer = MockServiceSetup.getWireMockServer();

    @BeforeAll
    public static void setup(){
        System.out.println("Starting Mock Service..");
        wireMockServer.start();
    }

    @AfterAll
    public static void finish(){
        System.out.println("Stopping Mock Service..");
        wireMockServer.stop();
    }


    @Test
    void testParallel() throws InterruptedException {

        Results results = Runner.path("classpath:features").tags("@smoke")
                .outputCucumberJson(true)
                .parallel(5);
        generateReport(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String reportOutpath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(reportOutpath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Accumulus");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}
