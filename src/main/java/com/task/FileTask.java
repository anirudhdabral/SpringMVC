package com.task;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import database.Tshirts;

public class FileTask extends TimerTask {

	private List<String> filenames = new ArrayList<String>();
	final String folderPath = ".\\csv files";

	private void fetch(String file) {
		String path = folderPath + "\\" + file;
		try {
			CSVParser parser = new CSVParserBuilder().withSeparator('|').build();
			FileReader filereader = new FileReader(path);
			CSVReader csvReader = new CSVReaderBuilder(filereader).withCSVParser(parser).withSkipLines(1).build();
			List<String[]> allData = csvReader.readAll();

			SessionFactory factory = new Configuration().configure().buildSessionFactory();
			Session session = factory.openSession();
			Transaction tx = session.beginTransaction();

			for (String[] item : allData) {
				Tshirts temp = new Tshirts(item[0], item[1], item[2], item[3], item[4], Double.parseDouble(item[5]),
						Double.parseDouble(item[6]), item[7]);
				session.saveOrUpdate(temp);
			}
			tx.commit();
			session.close();
			factory.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void run() {
		File folder = new File(folderPath);
		for (File fileEntry : folder.listFiles()) {
			if (!fileEntry.isDirectory() && fileEntry.getName().endsWith(".csv")
					&& filenames.contains(fileEntry.getName()) == false) {
				filenames.add(fileEntry.getName());
				fetch(fileEntry.getName());
			}
		}
	}

}
