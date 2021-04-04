/**
 * File name: TextUtils
 * Description: The utility class related to Text
 *
 *
 * Modification Log
 * ========================================================
 * Ver Date       Author         Modification
 * --- ---------- -------------- --------------------------
 * 1.0 04.04.2021 Joe Cheng      Initial Version, added getCosineDistance() method
 */

public with sharing class TextUtils {

    /**
     * @param doc1 The document 1 to compare with document 2 as a String
     * @param doc2 The document 2 to compare with document 1 as a string
     *
     * @return the cosine distance as a Decimal, from 0 (completely different) to 1 (same)
     */
    public static Decimal getCosineDistance(String doc1, String doc2) {
        // convert the documents to lists, each word as an element
        List<String> arrDoc1 = doc1.split(' ');
        List<String> arrDoc2 = doc2.split(' ');

        // generate the word frequency maps
        // key -> word, which appears in both documents
        // value -> the # of occurrence of the word in the document
        Map<String, Integer> wordFrequencyMap1 = new Map<String, Integer>();
        Map<String, Integer> wordFrequencyMap2 = new Map<String, Integer>();
        for (Integer i = 0; i < arrDoc1.size(); i++) {
            if (wordFrequencyMap1.containsKey(arrDoc1[i])) {
                wordFrequencyMap1.put(arrDoc1[i], wordFrequencyMap1.get(arrDoc1[i]) + 1);
            } else {
                wordFrequencyMap1.put(arrDoc1[i], 1);
            }
            if (!wordFrequencyMap2.containsKey(arrDoc1[i])) {
                wordFrequencyMap2.put(arrDoc1[i], 0);
            }
        }
        for (Integer i = 0; i < arrDoc2.size(); i++) {
            if (wordFrequencyMap2.containsKey(arrDoc2[i])) {
                wordFrequencyMap2.put(arrDoc2[i], wordFrequencyMap2.get(arrDoc2[i]) + 1);
            } else {
                wordFrequencyMap2.put(arrDoc2[i], 1);
            }
            if (!wordFrequencyMap1.containsKey(arrDoc2[i])) {
                wordFrequencyMap1.put(arrDoc2[i], 0);
            }
        }

        // calculate the cosine distance of the two documents
        Integer dotProduct = 0;
        Integer doc1Sq = 0;
        Integer doc2Sq = 0;
        for (Integer i = 0; i < arrDoc1.size(); i++) {
            dotProduct = dotProduct + (wordFrequencyMap1.get(arrDoc1[i])) * (wordFrequencyMap2.get(arrDoc1[i]));
            doc1Sq = doc1Sq +  (wordFrequencyMap1.get(arrDoc1[i])) *  (wordFrequencyMap1.get(arrDoc1[i]));
            doc2Sq = doc2Sq +  (wordFrequencyMap2.get(arrDoc1[i])) *  (wordFrequencyMap2.get(arrDoc1[i]));
        }
        return dotProduct / Math.sqrt(doc1Sq * doc2Sq);
    }

}