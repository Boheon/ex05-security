package org.galapagos.service;

import java.io.FileInputStream;

import org.galapagos.domain.BasketballVO;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import weka.classifiers.Classifier;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.SerializationHelper;


@Log4j
@Service
public class BasketballServiceImpl implements BasketballService {

	Classifier model;
	Instances dataSet;
	
	public BasketballServiceImpl() {
		// 모델 불러오기
		try {
			String[] classLabels = { "Shooting Guard", "Center" };
			dataSet = WekaUtil.makeInstnaces(7, classLabels);
			
			model = (Classifier)SerializationHelper.read(
					new FileInputStream("c:/temp/baseket-j48.model"));	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public String predict(BasketballVO value) {
		Instance data = value.toInstance();
		data.setDataset(dataSet);
				
		// 분류하기
		double result=0;
		try {
			result = model.classifyInstance(data);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataSet.classAttribute().value((int)result);
	}

}
