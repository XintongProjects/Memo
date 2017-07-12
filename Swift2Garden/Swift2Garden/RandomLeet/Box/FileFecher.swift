/* Create an image-fetcher that handles fetches of images when given URLs.
 You are given two objects to use in your implementation:
 1. a cache to store the images in memory
 2. a url-request-client to request images
 Assume these two objects are already implemented.

 Your image-fetcher must handle repeated fetches for the same URL
 such that the url-request-client is not called more than necessary.

 Note: Everything should be on the main thread. */

// =========== url-request-client (given) =================================
protocol DBImageURLRequestClientDelegate: class {
    func didDownloadImage(image: UIImage, forURL url: NSURL)
}

class DBImageURLRequestClient {
    weak var delegate: DBImageURLRequestClientDelegate?
    init() {}
    func downloadImageAtURL(url: NSURL) {}
}

// =========== cache (given) =================================
class DBImageCache<Key: Hashable> {
    // There may be something here
    init() {}
    func setImage(image: UIImage, forKey key: Key) {}
    func imageForKey(key: Key) -> UIImage? {}
}

// =========== image fetcher (please implement) =================================
public class DBImageFetcher: DBImageURLRequestClientDelegate {
    public typealias DBImageFetcherBlock = (UIImage) -> ()
    private var theRightImage = UIImage()
    public static let sharedInstance = DBImageFetcher()

    private let client = DBImageURLRequestClient()
    private let cache = DBImageCache<URL>()


    private init() {
        client.delegate = self
    }

    public func fetchImageForURL(url: NSURL, onSuccess: DBImageFetcherBlock) {
        // please implement me
        if cache.imageForKey(url) == nil {
            client.downloadImageAtURL(url)
        }
        else{
            theRightImage = cache.imageForKey(url)
        }

        onSuccess(theRightImage){
            theRightImage = cache.imageForKey(url)
        }
    }

    func didDownloadImage(image: UIImage, forURL url: NSURL) {
        // please implement me
        cache.setImage(image, forKey:url)

    }

}


//client code
let fetcher = DBImageFetcher.sharedInstance()
fetcher.fetchImageForURL(url: "google.com/kittens.jpg", onSuccess: { theRightImage in
    someImageView.image = theRightImage
})

