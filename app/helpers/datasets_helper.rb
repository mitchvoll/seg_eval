module DatasetsHelper
    
    def getDataset(dataset)
        x = Dataset.find(dataset.id)
        x.download_num = x.download_num + 1
        x.save
        return "uploads/dataset/#{dataset.user.id}/#{dataset.id}/#{dataset.filename}"
    end
    
end
