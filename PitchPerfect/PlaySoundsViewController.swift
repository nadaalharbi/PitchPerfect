import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    // MARK: Outlets of all the buttons
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!//! to force wrapping
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    // enum which contains all the cases from the same type(Button)
    enum ButtonType: Int {
    case slow = 0, fast, chimpmunk, veder, echo, reverb
    }// end of enum
    
    // MARK: Actions function
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!){
        case .slow:
            playSound(rate: 0.5)// calling func from the extension file
        case .fast:
            playSound(rate: 1.5)
        case .chimpmunk:
            playSound(pitch: 1000)
        case .veder:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }// end of switch statment
        
        configureUI(.playing)
    }// end of playSoundForButton()

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()// calling func from the extension file to stop (playingNode, Timer and Engine)
    }// end of stopButtonPressed()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()// calling func from the extension file
        
        snailButton.imageView?.contentMode = .scaleAspectFit
        chipmunkButton.imageView?.contentMode = .scaleAspectFit
        rabbitButton.imageView?.contentMode = .scaleAspectFit
        vaderButton.imageView?.contentMode = .scaleAspectFit
        echoButton.imageView?.contentMode = .scaleAspectFit
        reverbButton.imageView?.contentMode = .scaleAspectFit
        stopButton.imageView?.contentMode = .scaleAspectFit
        
    }// end of viewDidLoad()
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }// end of viewWillAppear()
    
}// end of class
