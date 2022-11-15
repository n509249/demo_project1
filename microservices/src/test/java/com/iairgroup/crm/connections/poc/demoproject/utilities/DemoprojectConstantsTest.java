package com.iairgroup.crm-connections.poc.demoproject.utilities;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;

import static org.junit.Assert.assertTrue;

/**
 * Test Class created to test the private constructor creation of the constants class
 *
 * @author Your_Full_Name (Your_Bsafe)
 */
@RunWith(PowerMockRunner.class)
public class DemoprojectConstantsTest {

    /**
     * Scenario : Test Method to test the DemoprojectConstants class
     *
     * @throws Exception - Exception
     */
    @Test
    public void testPrivateConstructor() throws Exception {
        Constructor constructor = DemoprojectConstants.class.getDeclaredConstructor();
        assertTrue(Modifier.isPrivate(constructor.getModifiers()));
        constructor.setAccessible(true);
        constructor.newInstance();
    }
}
