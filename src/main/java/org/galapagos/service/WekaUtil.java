package org.galapagos.service;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import weka.classifiers.Classifier;
import weka.core.Attribute;
import weka.core.DenseInstance;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.SerializationHelper;

public class WekaUtil {
	public static Classifier loadModel(String path) throws Exception {
		return (Classifier) SerializationHelper.read(
				new FileInputStream(path));

	}
	

	public static Instances makeInstnaces(String[] attrNames, String[] classLabels) {
		ArrayList<Attribute> attrList = new ArrayList<>();
		for(String name : attrNames) {
			attrList.add(new Attribute(name));
		}
		return makeInstnaces(attrList, classLabels);
	}

	public static Instances makeInstnaces(int length, String[] classLabels) {
		ArrayList<Attribute> attrList = new ArrayList<>();
		for(int i=0; i<length; i++) {
			attrList.add(new Attribute("attr_" + i));
		}
		return makeInstnaces(attrList, classLabels);
	}

	public static Instances makeInstnaces(ArrayList<Attribute> attrList, String[] classLabels) {
		List<String> labelList = Arrays.asList(classLabels);
		attrList.add(new Attribute("@@class@@", labelList));
		
		Instances dataSet = new Instances("dataset", attrList, 0);
		dataSet.setClassIndex(attrList.size()-1);
		return dataSet;
	}
	
	public static Instance createInstance(Instances dataSet, double[] values) {
		Instance data1 = new DenseInstance(1, values );
		data1.setDataset(dataSet);
		return data1;
	}
	
	public static String getLabel(Instances dataSet, double result ) {
		return dataSet.classAttribute().value((int)result);
	}
}
