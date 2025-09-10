import os
import matplotlib.pyplot as plt
import pandas as pd

def getdir(version:str, dataset:str):
    return os.path.join('data', version, dataset)

def formatData(version:str, dataset:str, filename:str):
    """Fixes inconsistent delimiters in data file, also replaces the delimiter for headings"""

    path = os.path.join(getdir(version, dataset), filename+'.txt')
    colnames = ''
    with open(path) as f:
        colnames = f.readline()
        data = f.readlines()
    colnames = colnames.replace('       ', '  ')

    for index, line in enumerate(data):
        if '  ' not in line:
            line = line.split(' ')
            data[index] = f' {line[1]}  {line[2]}\n'

    with open(path, 'w') as f:
        f.write(colnames)
        for line in data:
            f.write(line)


def formatAll(version:str, dataset:str):
    path = getdir(version, dataset)
    for file in os.listdir(path):
        if '.txt' in file:
            print(f'formatting {file}...')
            formatData(version, dataset, file.strip('.txt'))


def readData(version:str, dataset:str, filename:str, xlabel:str, ylabel:str):
    path = os.path.join(getdir(version, dataset), filename+'.txt')
    data = pd.read_csv(path, sep="  ", engine='python')
    data.columns = [xlabel, ylabel]
    return data


def readAndCombineData(version:str, dataset:str):
    combined = pd.DataFrame()
    path = getdir(version, dataset)
    for file in os.listdir(path):
        if '.txt' in file:
            print(f'reading {file}...')
            file = file.strip('.txt')
            data = readData(version, dataset, file, 'freq (Hz)', file)
            if combined.empty:
                combined = data
            else:
                combined[file] = data[file]
    return combined


def plot2DData(
        data,
        xlabel:str,
        vers:str,
        dir:str,
        title:str,
        freqRes:bool,
        show:bool=False,
        save:bool=True
    ):

    data.plot(x=xlabel)
    plt.rcParams["figure.figsize"] = (40,32)
    if freqRes:
        plt.xscale('log')
    if not freqRes:
        plt.rcParams.update({'font.size': 30})
    plt.grid(True)
    plt.title(title)

    if save:
        path = os.path.join(getdir(vers, dir), title+'.pdf')
        plt.savefig(path)

    if show:
        plt.show()


def plotAllFreqResponse(version:str, dataset:str, xlabel:str):
    formatAll(version=version, dataset=dataset)
    data = readAndCombineData(version=version, dataset=dataset)
    print(data)
    plot2DData(
        data = data,
        xlabel=xlabel,
        vers=version,
        dir=dataset,
        title='Frequency response of different gains',
        freqRes=True,
        show=True
    )


def plotSamples(version:str, dataset:str, xlabel:str):
    formatAll(version=version, dataset=dataset)

    path = getdir(version, dataset)
    for file in os.listdir(path):
        if '.txt' in file:
            print(f'reading {file}...')
            file = file.strip('.txt')
            data = readData(version, dataset, file, xlabel, file)
            plot2DData(
                data=data,
                xlabel=xlabel,
                vers=version,
                dir=dataset,
                title=file,
                freqRes=False
            )

def comparePrePostLayout(version:str, dataset:str, filename:str, xlabel:str):
    postLayoutVersion = version + '_postlayout'


    preLayoutData = readData(version, dataset, filename, xlabel, ylabel=filename)
    postLayoutData = readData(postLayoutVersion, dataset, filename, xlabel, ylabel=filename)

    plt.rcParams["figure.figsize"] = (20,16)
    plt.plot(preLayoutData[xlabel], preLayoutData[filename], label='pre-layout')
    plt.plot(postLayoutData[xlabel], postLayoutData[filename], label='post-layout')

    if dataset == 'GainvsFreq':
        plt.xscale('log')
    plt.xlabel(xlabel)
    plt.ylabel(filename)
    plt.legend()

    plt.grid(True)
    plt.title(filename)


    path = os.path.join('data', postLayoutVersion, 'comparisons', filename+'.pdf')
    plt.savefig(path)

    # plt.show()

"""The function plotSamples raises an error the first time i run it and then when i rerun it its fine? not sure what it is but cant be asked tbh"""
vers = 'v4_Cc0.8pF'
# plotAllFreqResponse(version=vers, dataset='GainvsFreq', xlabel='freq (Hz)')
# plotSamples(version=vers, dataset='sample_waves', xlabel='time (s)')
# plotSamples(version=vers, dataset='SR', xlabel='time (s)')
comparePrePostLayout(version=vers, dataset='sample_waves', filename='a0.01_f10k_gain100', xlabel='freq (Hz)')