//
//  RecordingViewController.swift
//  Bobo
//
//  Created by Azura Sakan Taufik on 29/04/21.
//

import UIKit
import AVFoundation

class RecordingViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {

    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    var recordingSession: AVAudioSession! = AVAudioSession()
    var audioRecorder: AVAudioRecorder! = AVAudioRecorder()
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // recordBtn.isEnabled = false
        // Ask permission to record
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        // recordBtn.isEnabled = true
                        recordBtn.setTitle("Tap to Record", for: .normal)
                        playBtn.setTitle("Play", for: .normal)
                    } else {
                        print("Failed to record")
                    }
                }
            }
        } catch {
            print("Failed to record")
        }
        
    }
    
    @IBAction func onRecordBtnTap(_ sender: Any) {
        if audioRecorder == nil {
            self.startRecording()
            let pulse = PulsingCALayer(numberOfPulses: 1, radius: 110, position: recordBtn.center)
            pulse.animationDuration = 0.8
            pulse.backgroundColor = UIColor.init(named: "BoboBlue")?.cgColor
            self.view.layer.insertSublayer(pulse, below: recordBtn.layer)
        } else {
            self.finishRecording(success: true)
        }
    }
    
    @IBAction func onPlayBtnTap(_ sender: Any) {
        if audioPlayer == nil {
            self.playRecording()
        } else {
            self.stopRecording()
        }
    }
    
    func startRecording() {
        // Set the directory in which the recording will be stored at
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        
        // The settings of the audio we want to store
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 1200,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            recordBtn.setBackgroundImage(UIImage.init(systemName: "stop.circle.fill"), for: .normal)
            recordBtn.setTitle("Tap to Stop", for: .normal)
            // Show stop button while recording
            
            audioRecorder.record()
        } catch {
            finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            // Show replay & delete button
            recordBtn.setTitle("Tap to Re-Record", for: .normal)
            recordBtn.setBackgroundImage(UIImage.init(systemName: "mic.circle.fill"), for: .normal)
        } else {
            // Show record button
            // recordBtn.isEnabled = true
            recordBtn.setTitle("Tap to Record", for: .normal)
            recordBtn.setBackgroundImage(UIImage.init(systemName: "mic.circle.fill"), for: .normal)
        }
    }
    
    func playRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFilename)
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            audioPlayer.volume = 1.0
            audioPlayer.play()
            playBtn.setTitle("Stop", for: .normal)
            playBtn.setBackgroundImage(UIImage.init(systemName: "pause.circle.fill"), for: .normal)
        } catch {
            print("Can't play audio")
        }
    }
    
    func stopRecording() {
        audioPlayer.stop()
        audioRecorder = nil
        playBtn.setTitle("Play", for: .normal)
        playBtn.setBackgroundImage(UIImage.init(systemName: "play.circle.fill"), for: .normal)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
}
