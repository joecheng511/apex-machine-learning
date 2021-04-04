/**
 * File name: TextUtilsTest
 * Description: The test class for to TextUtils
 *
 *
 * Modification Log
 * ========================================================
 * Ver Date       Author         Modification
 * --- ---------- -------------- --------------------------
 * 1.0 04.04.2021 Joe Cheng      Initial Version, added testGetCosineDistance() method
 */

@IsTest
private class TextUtilsTest {

    private static final String document1 = 'Hello, I tried making an account a few days ago and as soon as I uploaded my license and photo my account has been disabled, and i was told i need to send documents to this email. So i attached the documents.';
    private static final String document2 = 'Hello, I tried to make an account and i uploaded my driving license and photo but my account got disabled.';

    @IsTest
    static void testGetCosineDistance() {
        Decimal similarity = TextUtils.getCosineDistance(document1, document2);
        System.assertNotEquals(0, similarity);
    }

}