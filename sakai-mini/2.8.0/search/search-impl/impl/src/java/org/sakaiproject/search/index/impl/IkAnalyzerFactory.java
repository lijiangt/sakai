package org.sakaiproject.search.index.impl;

import org.apache.lucene.analysis.Analyzer;
import org.sakaiproject.search.index.AnalyzerFactory;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class IkAnalyzerFactory implements AnalyzerFactory {

	public Analyzer newAnalyzer() {
		return new IKAnalyzer();
	}
}
