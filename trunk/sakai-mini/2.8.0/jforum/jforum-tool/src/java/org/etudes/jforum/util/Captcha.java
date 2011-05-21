/**********************************************************************************
 * $URL: https://source.sakaiproject.org/contrib/etudes/sakai-jforum/tags/2.8.1/jforum-tool/src/java/org/etudes/jforum/util/Captcha.java $ 
 * $Id: Captcha.java 55476 2008-12-01 19:16:20Z murthy@etudes.org $ 
 *********************************************************************************** 
 * 
 * Copyright (c) 2008 Etudes, Inc. 
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at 
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 * See the License for the specific language governing permissions and 
 * limitations under the License. 
 * 
 * Portions completed before July 1, 2004 Copyright (c) 2003, 2004 Rafael Steil, All rights reserved, licensed under the BSD license. 
 * http://www.opensource.org/licenses/bsd-license.php 
 * 
 * Redistribution and use in source and binary forms, 
 * with or without modification, are permitted provided 
 * that the following conditions are met: 
 * 
 * 1) Redistributions of source code must retain the above 
 * copyright notice, this list of conditions and the 
 * following disclaimer. 
 * 2) Redistributions in binary form must reproduce the 
 * above copyright notice, this list of conditions and 
 * the following disclaimer in the documentation and/or 
 * other materials provided with the distribution. 
 * 3) Neither the name of "Rafael Steil" nor 
 * the names of its contributors may be used to endorse 
 * or promote products derived from this software without 
 * specific prior written permission. 
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT 
 * HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, 
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE 
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER 
 * IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN 
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE 
 ***********************************************************************************/
package org.etudes.jforum.util;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.etudes.jforum.JForum;
import org.etudes.jforum.SessionFacade;
import org.etudes.jforum.util.preferences.ConfigKeys;
import org.etudes.jforum.util.preferences.SystemGlobals;

import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.FunkyBackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.GradientBackgroundGenerator;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.TwistedAndShearedRandomFontGenerator;
import com.octo.captcha.component.image.textpaster.RandomTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.wordgenerator.RandomWordGenerator;
import com.octo.captcha.component.wordgenerator.WordGenerator;
import com.octo.captcha.engine.image.ListImageCaptchaEngine;
import com.octo.captcha.image.ImageCaptchaFactory;
import com.octo.captcha.image.gimpy.GimpyFactory;

/**
 * @author James Yong
 */
public class Captcha extends ListImageCaptchaEngine
{
	private static final Log logger = LogFactory.getLog(Captcha.class);
	
	private static Captcha classInstance = new Captcha();
	private List backgroundGeneratorList;
	private List textPasterList;
	private List fontGeneratorList;

	private static final String charsInUse = "123456789ABCDEFGHJLKMNPRSTWXYZabcdefghijlmnopkrstuvxzyk@#%^";

	/**
	 * Gets the singleton
	 * 
	 * @return Instance of Captcha class
	 */
	public static Captcha getInstance()
	{
		return classInstance;
	}

	protected void buildInitialFactories()
	{
		this.backgroundGeneratorList = new ArrayList();
		this.textPasterList = new ArrayList();
		this.fontGeneratorList = new ArrayList();
		
		int width = SystemGlobals.getIntValue(ConfigKeys.CAPTCHA_WIDTH);
		int height = SystemGlobals.getIntValue(ConfigKeys.CAPTCHA_HEIGHT);
		int minWords = SystemGlobals.getIntValue(ConfigKeys.CAPTCHA_MIN_WORDS);
		int maxWords = SystemGlobals.getIntValue(ConfigKeys.CAPTCHA_MAX_WORDS);
		int minFontSize = SystemGlobals.getIntValue(ConfigKeys.CAPTCHA_MIN_FONT_SIZE);
		int maxFontSize = SystemGlobals.getIntValue(ConfigKeys.CAPTCHA_MAX_FONT_SIZE);

		this.backgroundGeneratorList.add(new GradientBackgroundGenerator(new Integer(width), 
				new Integer(height), Color.BLACK, Color.GRAY));
		this.backgroundGeneratorList.add(new FunkyBackgroundGenerator(new Integer(250), new Integer(50)));

		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.RED));
		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.ORANGE));
		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.BLUE));
		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.WHITE));
		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.GREEN));
		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.GRAY));
		this.textPasterList.add(new RandomTextPaster(new Integer(minWords), new Integer(maxWords), Color.YELLOW));

		this.fontGeneratorList.add(new TwistedAndShearedRandomFontGenerator(new Integer(minFontSize), new Integer(maxFontSize)));

		// Create a random word generator
		WordGenerator words = new RandomWordGenerator(charsInUse);

		for (Iterator fontIter = this.fontGeneratorList.iterator(); fontIter.hasNext();) {
			FontGenerator fontGeny = (FontGenerator) fontIter.next();

			for (Iterator backIter = this.backgroundGeneratorList.iterator(); backIter.hasNext();) {
				BackgroundGenerator bkgdGeny = (BackgroundGenerator) backIter.next();

				for (Iterator textIter = this.textPasterList.iterator(); textIter.hasNext();) {
					TextPaster textPaster = (TextPaster) textIter.next();

					WordToImage word2image = new ComposedWordToImage(fontGeny, bkgdGeny, textPaster);
					
					// Creates a ImageCaptcha Factory
					ImageCaptchaFactory factory = new GimpyFactory(words, word2image);
					
					// Add a factory to the gimpy list (A Gimpy is a ImagCaptcha)
					addFactory(factory);
				}
			}
		}

	}

	public void writeCaptchaImage()
	{
		BufferedImage image = SessionFacade.getUserSession().getCaptchaImage();
		
		if (image == null) {
			return;
		}

		OutputStream outputStream = null;
		
		try {
			outputStream = JForum.getResponse().getOutputStream();
			ImageIO.write(image, "jpg", outputStream);
		}
		catch (IOException ex) {
			logger.error(ex);
		}
		finally {
			if (outputStream != null) {
				try {
					outputStream.close();
				}
				catch (IOException ex) {}
			}
		}
	}
}
