
import Foundation

enum HeightError : Error {
    case maxHeight
    case minHeight
}

func getHeightCheckingResult(height: Int) -> Result<Bool, HeightError> {
    if height < 120 {
        return Result.failure(HeightError.minHeight)
    } else if height > 190 {
        return Result.failure(HeightError.maxHeight)
    } else if height > 160 {
        return Result.success(true)
    } else {
        return Result.success(false)
    }
}

let res = getHeightCheckingResult(height: 170)
print(res)

switch res {
    case .success(let value):
        print(value)
    case .failure(let _):
        print("error!")
}
